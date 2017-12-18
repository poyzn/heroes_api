# frozen_string_literal: true

module API
  module Users
    class RegistrationsController < Devise::RegistrationsController
      include RescueCallbacks
      rescue_from ActionController::ParameterMissing, with: :parameter_is_missing
      rescue_from Apipie::ParamInvalid, with: :parameter_is_invalid
      
      respond_to :json

      resource_description do
        name  'User registration'
        short 'No auth token required'
      end

      api :POST, '/users/sign_up', 'Registers a new user.'
      param :user, Hash, required: true do
        param :email, String, 'Email', required: true
        param :password, String, 'Пароль', required: true
      end
      formats %w[json plain]
      example Requests::Users.sign_up
      example Responses::Users.one
      def create
        user = User.create user_params
        if user.errors.empty?
          response.headers['Authorization'] = JWTWrapper.encode(user_id: user.id )
          render json: user, status: 201, serializer: UserSerializer
        else
          render json: { error: true, message: 'Registration failed', errors: user.errors }, status: 400
        end
      end

      protected

      def user_params
        params.require(:user).permit :email, :password
      end
    end
  end
end