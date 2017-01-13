Rails.application.routes.draw do
  resources :virtual_orders
  resources :page_visitors
  mount Split::Dashboard, at: 'split'
  root 'pages#home'
end
