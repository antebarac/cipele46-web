Cipele46Web::Application.routes.draw do
  get "categories/index"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  get 'home' => 'home#index'
  devise_for :users
  
  resources :ads, :only => [:create, :edit, :new, :show, :update]
  resources :users
  resources :regions, :only => [:index]
  resources :categories, :only => [:index]
end