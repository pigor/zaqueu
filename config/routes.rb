Zaqueu::Application.routes.draw do
  get "password_resets/create"
  get "password_resets/edit"
  get "password_resets/update"
  get "home/index"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"

  resources :users do
    resources :collections do
      get :notify
    end
  end

  resources :collections, only: :none do
    get :close_notify
  end

  resources :sessions
  resources :password_resets

  root :to => "home#index"
end
