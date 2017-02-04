Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  get 'copy_succeed', to: 'pages#copy_succeed'

  resources :virtual_orders
  resources :page_visitors
  mount Split::Dashboard, at: 'split'
  get 'pages/contact'
  get 'pages/company'
  get 'pages/products'
  get '/dashboard', to: 'pages#dashboard'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  root 'pages#home'
end
