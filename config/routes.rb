Coursiz::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :categories do
    resources :quizzes
  end
  resources :stats
  match "*path", :to => "home#index"  # catch all redirect to 404
end