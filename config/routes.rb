Rails.application.routes.draw do
  resources :job_applications
  resources :job_posts
  get 'home/about'
  root to: "home#index"
  post '/mark_as_seen', to: 'job_applications#mark_as_seen'

  get '/search', to: "job_posts#search"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
