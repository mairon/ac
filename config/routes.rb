Rails.application.routes.draw do

  get "search_companies" => "pages#search_companies"
  get "search" => "pages#search"

  scope "(:locale)" do

    root 'pages#index'  
    devise_for :users 
    devise_scope :user do
      get  '/users/sign_out', to: 'devise/sessions#destroy'
      post '/sessions/user', to: 'devise/sessions#create'
    end  
    resources :newsletters, only: [:new, :create]
    resources :contacts, only: [:new, :create]
    
    namespace :admin do
      get  '/painel', to: 'painel#index'
      resources :crawlers
      resources :exchanges
      resources :currencies
      resources :schedules
      resources :companies do
        member do 
          get 'affiliates'
        end
      end
      resources :cities
      resources :states
      resources :countries
      resources :standard_exchanges
      resources :users
      resources :exchange_operations
      resources :newsletters
      resources :contacts
    end

    namespace :pcompany do
      get  '/painel', to: 'painel#index'

      resources :exchanges, only: [:index, :new, :create, :edit, :update, :destroy] do
        collection do
          get  '/multiple_records', to: 'exchanges#multiple_records'
          get  '/multiple_records_assign', to: 'exchanges#multiple_records_assign'
        end
      end
      resources :companies, only: [:edit, :update]
    end

    namespace :pclient do
      get  '/painel', to: 'painel#index'
    end
  end  
end
