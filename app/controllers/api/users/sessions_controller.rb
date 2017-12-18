# frozen_string_literal: true

module API
  module Users
    class SessionsController < Devise::SessionsController
      include RescueCallbacks
      rescue_from ActionController::ParameterMissing, with: :parameter_is_missing
      rescue_from Apipie::ParamInvalid, with: :parameter_is_invalid
      
      respond_to :json

      resource_description do
        name  'User authentication'
        short 'No auth token required'
      end

      api :POST, '/users/sign_in', 'User authentication with email and password.'
      param :user, Hash, required: true do
        param :email, String, 'Email', required: true
        param :password, String, 'Пароль', required: true
      end
      example Requests::Users.sign_in
      example Responses::Users.one
      formats %w[json plain]
      def create
        user = warden.authenticate(scope: :user)
        if user
          response.headers['Authorization'] = JWTWrapper.encode(user_id: user.id )
          render json: user, status: 200, serializer: UserSerializer
        else
          render json: {error: true, message: 'Authentication failed'}, status: 401
        end
      end
      
      protected
      
      def oauth_params
        params.require(:user).permit :email, :password
      end
    end
  end
end