Rails.application.routes.draw do
  get 'users/new'

  resources :virtual_orders
  resources :page_visitors
  mount Split::Dashboard, at: 'split'
  get 'pages/contact'
  get 'pages/company'
  root 'pages#home'
end
