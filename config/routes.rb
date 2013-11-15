Coursiz::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  # resources :categories

  match 'categories/:category' => 'categories#show'
  resources :stats
  resources :categories
  match "*path", :to => "home#index"  # catch all redirect to 404
end