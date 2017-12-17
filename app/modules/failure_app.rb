class FailureApp < Devise::FailureApp
  def respond
    if request.original_fullpath =~ /\A\/api/
      auth_failure
    else
      super
    end
  end
  
  def auth_failure
    self.status = 401
    self.content_type = 'application/json'
    self.response_body = '{"error": true, "message": "Token authentication error"}'
  end
end