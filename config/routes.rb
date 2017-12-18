Rails.application.routes.draw do
  apipie
  devise_for :users, skip: :all
  devise_for :admins, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, default: { respond_to: :json } do
    devise_scope :user do
      post '/users/sign_up',      to: 'users/registrations#create'
      post '/users/sign_in',      to: 'users/sessions#create'
    end
    resources :heros, only: [:index, :show] do
      resources :abilities, only: [:index]
    end
    resources :abilities, only: [:index, :show]
  end
  match '*unmatched_route', :to => 'application#raise_not_found!', via: :all
end
