# frozen_string_literal: true

require 'rails_helper'

describe 'API::HeroesController', type: :api do
  context 'without auth token' do
    it 'responds with 401 while getting a list of heroes' do
      get '/api/heroes'
      expect(last_response.status).to eq 401
    end
    it 'responds with 401 while getting a hero data' do
      hero = create :hero
      get "/api/heroes/#{hero.id}"
      expect(last_response.status).to eq 401
    end
  end
  context 'with auth token' do
    before :each do
      @user = create :user
      @token = JWT.encode({ user_id: @user.id }, Rails.application.secrets[:jwt_secret])
      header 'Authorization', "Bearer #{@token}"
    end
    it 'responds with empty array without heroes' do
      get '/api/heroes'
      expect(last_response.status).to eq 200
      expect(json.count).to eq 0
    end
    it 'lists many heroes' do
      create_list :hero, 3
      get '/api/heroes'
      expect(json.count).to eq 3
    end
    it 'lists one hero' do
      hero = create :hero
      get "/api/heroes/#{hero.id}"
      expect(json['id']).to eq hero.id
    end
    %w{ id name real_name health armour shield }.each do |attr|
      it "returns hero parameter #{attr}" do
        hero = create :hero
        get "/api/heroes/#{hero.id}"
        expect(json[attr]).to eq hero.method(attr).call
      end
    end
  end
end