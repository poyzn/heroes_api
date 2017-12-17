# frozen_string_literal: true

require 'rails_helper'

describe 'API::Users::RegistrationsController', type: :api do
  before :each do
    header 'Content-Type', 'application/json'
  end

  context 'without token' do
    it 'registers a user with correct data' do
      post '/api/users/sign_up', { user: { email: 'user@example.com', password: '123123123' } }.to_json
      expect(last_response.status).to eq 201
      expect(json['id']).to be > 0
    end
    %w{email password}.each do |attr|
      it "doesn't register without required #{attr.humanize}" do
        data = { user: { email: 'user@example.com', password: '123123123' } }
        data[:user][attr.to_sym]=nil
        post '/api/users/sign_up', data.to_json
        expect(last_response.status).to eq 422
        expect(json['error']).to eq true
      end
    end
    it 'responds with authorization header' do
      post '/api/users/sign_up', { user: { email: 'user@example.com', password: '123123123' } }.to_json
      expect(last_response.headers['Authorization']).not_to be_empty
    end
  end
end
