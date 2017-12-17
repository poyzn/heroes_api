Rails.application.routes.draw do
  apipie
  devise_for :users, skip: :all
  namespace :api, default: { respond_to: :json } do
    devise_scope :user do
      post '/users/sign_up',      to: 'users/registrations#create'
      post '/users/sign_in',      to: 'users/sessions#create'
    end
    resources :heroes
    resources :abilities
  end
  match '*unmatched_route', :to => 'application#raise_not_found!', via: :all
end
