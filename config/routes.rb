Rails.application.routes.draw do
  resources :page_visitors
  root 'pages#home'
end
