# frozen_string_literal: true

Apipie.configure do |config|
  config.default_locale   = nil
  config.languages        = ['en']
  config.app_name         = 'Heroes'
  config.api_base_url     = '/api'
  config.doc_base_url     = '/apipie'
  config.api_controllers_matcher = File.join Rails.root, 'app', 'controllers',
                                             'api', '**', '/*.rb'
  config.namespaced_resources = true
  config.authenticate = Proc.new do
    authenticate_or_request_with_http_basic do |username, password|
      username == "heroes" && password == "heroes"
    end
  end
end
