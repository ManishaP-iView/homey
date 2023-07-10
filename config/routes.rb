Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "projects#index"

  resources :projects, only: [:update] do
    resources :comments, only: :create
  end
  resources :feeds, only: :index
end
