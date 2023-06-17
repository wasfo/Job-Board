Rails.application.routes.draw do
  resources :job_applications, except: :show
  resources :job_posts
  get 'home/about'
  root to: "home#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
