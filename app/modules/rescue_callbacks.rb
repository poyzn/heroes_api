module RescueCallbacks
  
  def self.included(base)
    base.class_eval do
      include InstanceMethods
      extend ClassMethods
    end
  end
  
  module ClassMethods; end
  
  # Some custom message for API calls
  module InstanceMethods
  
    protected

    def parameter_is_missing(data)
      render json: { error: true, message: "Input data error. Required parameter is missing #{data.param}"}, status: 422
    end

    def parameter_is_invalid(data)
      render json: { error: true, message: "Input data error. Wrong format for parameter: #{data}" }, status: 422
    end
    
    def record_not_found
      render json: { error: true, message: 'Record not found' }, status: 422
    end
    
    def token_decrypt_failure
      render json: { error: true, message: 'Invalid auth token' }, status: 422
    end
    
    def not_authorized_to_perform
      render json: { error: true, message: 'Not enough permissions to complete the operation' }, status: 401
    end
    
    def parameters_parse_error
      render json: { error: true, message: 'Invalid JSON' }, status: 422
    end
  
  end
  
end