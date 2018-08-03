Rails.application.routes.draw do
  get 'sessions/new'

  root 'static_pages#home'
  get 'static_pages/secret_page'

  get 'users/index', to: 'users#index'

  get 'users/new', to: 'users#new'
  post 'users/new', to: 'users#create'

  get 'users/:id/edit', to: 'users#edit'
  post 'users/:id/edit', to: 'users#update'

  get 'users/:id', to: 'users#show'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
end
