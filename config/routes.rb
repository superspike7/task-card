Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords'
  }

  resources :categories do
    resources :tasks, shallow: true
  end

  get 'today', to: 'categories#today'

  get 'home', to: 'static_pages#home'

  root 'categories#index'
end
