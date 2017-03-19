Rails.application.routes.draw do
  root to: 'invoices#index'

  resources :invoices
  resources :purchases
  resources :items

  get '/invoice_details/:id', to: 'invoices#details_json'
end
