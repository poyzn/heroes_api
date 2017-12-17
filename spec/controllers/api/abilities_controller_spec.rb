# frozen_string_literal: true

require 'rails_helper'

describe 'API::AbilitiesController', type: :api do
  before(:all) do
    header 'Content-Type', 'application/json'
  end
  context 'without auth token' do
    it 'responds with 401 while getting a list of abilities' do
      get '/api/abilities'
      expect(last_response.status).to eq 401
    end
    it 'responds with 401 while getting a ability data' do
      ability = create :ability
      get "/api/abilities/#{ability.id}"
      expect(last_response.status).to eq 401
    end
  end
  context 'with auth token' do
    before :each do
      @user = create :user
      @token = JWT.encode({ user_id: @user.id }, Rails.application.secrets[:jwt_secret])
      header 'Authorization', "Bearer #{@token}"
    end
    it 'responds with empty array without abilities' do
      get '/api/abilities'
      expect(last_response.status).to eq 200
      expect(json.count).to eq 0
    end
    it 'lists many abilities' do
      create_list :ability, 3
      get '/api/abilities'
      expect(json.count).to eq 3
    end
    it 'lists one ability' do
      ability = create :ability
      get "/api/abilities/#{ability.id}"
      expect(json['id']).to eq ability.id
    end
  end
end