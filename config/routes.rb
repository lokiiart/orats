Rails.application.routes.draw do
  resources :virtual_orders
  resources :page_visitors
  root 'pages#home'
end
