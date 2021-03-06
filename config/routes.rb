Educaytme::Application.routes.draw do

  resources :comments

  resources :commentables

  resources :notifications

  resources :object_types

  resources :updated_objects

  resources :tutorial_part_tests
  resources :tutorial_media_types
  resources :tutorial_medias
  get "subcategories/new"

  get "subcategories/create"

  get "subcategories/update"

  get "subcategories/delete"

  resources :sessions, :only => [:new, :create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  resources :subscriptions, :only => [:create, :destroy]
 
  resources :tutorial_parts

  resources :tutorial_panels
  resources :subcategories
  resources :categories do
    resources :subcategories
  end
  resources :tutorials do
    resources :tutorial_parts
    resources :tutorial_part_tests
  end

  resources :users do
    resources :tutorials
  end

  resources :users do
    member do
      get :following, :followers
    end
  end
  match '/settings',  :to => 'users#edit'
  match '/contact',   :to => 'pages#contact'
  match '/about',     :to => 'pages#about'
  match '/help',      :to => 'pages#help'
  match '/signup',    :to => 'users#new'
  match '/signin',    :to => 'sessions#new'
  match '/signout',   :to => 'sessions#destroy'
  match 'auth/:provider/callback' => 'sessions#create_with_provider'
  match ':controller/:action.:format'
  match 'users/:id/activate_account', :to => 'activations#activate_account'
  match '/forgot_password' , :to => 'users#forgot_password'
  root :to => 'pages#home'

end
