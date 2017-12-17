# frozen_string_literal: true

module APIHelper
  include Rack::Test::Methods

  def app
    Rails.application
  end
end
