Rails.application.routes.draw do
  get 'tasks/new'
  get 'tasks/edit'

  resources :categories do
    resources :tasks, shallow: true
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'categories#index'
end
