Zaqueu::Application.routes.draw do
  get "home/index"
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  
  resources :users
  resources :sessions
  
  root :to => "home#index"
end
