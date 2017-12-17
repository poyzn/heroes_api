module Devise
  module Strategies
    class JsonWebToken < Base
      def valid?
        request.headers['Authorization'].present?
      end
      
      def authenticate!
        return fail! unless claims
        return fail! unless claims.has_key?('user_id')
        user = User.find_by_id claims['user_id']
        return fail! unless user
        success! user
      end
      
      protected
      
      def claims
        strategy, token = request.headers['Authorization'].split(' ')
        return nil if (strategy || '').downcase != 'bearer'
        JWTWrapper.decode(token)
      rescue
        nil
      end
    end
  end
end