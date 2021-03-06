Rails.application.routes.draw do

  get 'review/create'

  mount Attachinary::Engine => "/attachinary"

  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  resources :equipment, only: [:index, :show]  do
    resources :bookings, only: [:new, :create, :index]
    resources :reviews, only: [:create]
  end

  resources :bookings, only: [:destroy, :show, :edit, :update]

  # get '/profiles/:id', to: "profiles#show", as: :profile
  # get '/profiles/edit', to: "profiles#edit", as: :edit_profile
  # patch '/profiles', to: 'profiles#update', as: :update_profile

  namespace :account do
    resource :profile
    resources :equipment
  end
end

