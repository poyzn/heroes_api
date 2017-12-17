# frozen_string_literal: true

module API
  class APIController < ApplicationController
    rescue_from ActionController::ParameterMissing, with: :parameter_is_missing
    rescue_from Apipie::ParamMissing, with: :parameter_is_missing
    rescue_from Apipie::ParamInvalid, with: :parameter_is_invalid
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActionController::InvalidAuthenticityToken, with: :not_authorized_to_perform
    rescue_from ActionDispatch::Http::Parameters::ParseError, with: :parameters_parse_error
    before_action :authenticate_user!
    respond_to :json
  end
end