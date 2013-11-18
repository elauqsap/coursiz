Coursiz::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  get '/categories/manage', to: 'categories#manage'
  # get '/categories/new', to: 'categories#manage'
  # get '/categories/:category_id/quizzes/new', to: 'categories#manage'
  post '/categories/quizzes', to: 'quizzes#create'
  resources :categories do
    resources :quizzes
  end
  resources :stats
  match "*path", :to => "home#index"  # catch all redirect to 404
end