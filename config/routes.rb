Rails.application.routes.draw do
  root 'homepage#index'
  get '/feeds' => 'feeds#index'

  # USERS
  post 'users' => 'users#create'
  # SESSIONS
  get 'authenticated' => 'sessions#authenticated'
  post 'sessions' => 'sessions#create'
  delete 'sessions' => 'sessions#destroy'
  # TWEETS
  get 'tweets' => 'tweets#index'
  get 'users/:username/tweets' => 'tweets#index_by_user'
  post 'tweets' => 'tweets#create'
  delete 'tweets/:id' => 'tweets#destroy'
  # Redirect all other paths to index page, which will be taken over by AngularJS
  get '*path' => 'homepage#index'
end
