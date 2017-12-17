# frozen_string_literal: true

require 'rails_helper'

describe 'API::Users::SessionsController', type: :api do
  before :each do
    @user = create :user, email: 'test@test.com', password: '123123123'
    header 'Content-Type', 'application/json'
  end

  it 'authenticate user with email and password' do
    data = { user: { email: @user.email, password: '123123123' } }
    post '/api/users/sign_in', data.to_json
    expect(json['id']).to eq @user.id
    expect(json['email']).to eq @user.email
  end
  it 'responds with authorization header' do
    post '/api/users/sign_in', { user: { email: @user.email, password: '123123123' } }.to_json
    expect(last_response.headers['Authorization']).not_to be_empty
  end
end
