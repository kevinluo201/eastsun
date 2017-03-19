Rails.application.routes.draw do
  root to: 'invoices#index'

  resources :invoices
  resources :purchases
  resources :items
  resources :customers, only: [:index, :show, :edit, :update]

  get '/invoice_details/:id', to: 'invoices#details_json'
end
