Rails.application.routes.draw do
  resources :exchange_operations
  root 'pages#index'  
  get "search" => "pages#search", :as => :search
  devise_for :users 
  devise_scope :user do
    get  '/users/sign_out', to: 'devise/sessions#destroy'
    post '/sessions/user', to: 'devise/sessions#create'
  end  
  
  namespace :admin do
    get  '/painel', to: 'painel#index'
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
