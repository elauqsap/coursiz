Coursiz::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  get '/admin_task/', to: 'home#index', as: 'index'
  post '/complete', to: 'home#complete', as: 'complete'
  get '/support', to: 'home#support', as: 'support'
  post '/add_task', to: 'home#add_task', as: 'add_task'
  get '/categories/manage', to: 'categories#manage'
  get '/categories/:category_id/quizzes/results', to: 'quizzes#results', as: 'quiz_results'
  post '/categories/:category_id/quizzes/checkanswer', to: 'quizzes#check_answer', as: 'check_answer'
  get '/categories/:category_id/quizzes/start', to: 'quizzes#start', as: 'start'
  get '/categories/:category_id/quizzes/set', :to=>'quizzes#set_session', as: 'set_session'
  post '/categories/quizzes', to: 'quizzes#create'
  post '/categories/quizzes/review', to: 'quizzes#quiz_review', as: 'quiz_review'
  resources :categories do
    resources :quizzes
  end
  resources :stats
  match "*path", :to => "home#index"  # catch all redirect to 404
end