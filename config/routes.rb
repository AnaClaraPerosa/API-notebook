Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :kinds

  api_version(:module => "V1", :path => {:value => "v1"}) do
    resources :contacts do
      resources :kind, only: [:show] 
      resources :kind, only: [:show], path: 'relationships/kinds' 

      resources :phones, only: [:show]
      resources :phones, only: [:show], path: 'relationships/phones'

      resource :phone, only: [:update, :create, :destroy]
      resource :phone, only: [:update, :create, :destroy], path: 'relationships/phone'

      resources :addresses, only: [:show, :update, :create, :destroy] 
      resources :addresses, only: [:show, :update, :create, :destroy], path: 'relationships/addresses'
    end
  end

  api_version(:module => "V2", :path => {:value => "v2"}) do
    resources :contacts do
      resources :kind, only: [:show] 
      resources :kind, only: [:show], path: 'relationships/kinds' 

      resources :phones, only: [:show]
      resources :phones, only: [:show], path: 'relationships/phones'

      resource :phone, only: [:update, :create, :destroy]
      resource :phone, only: [:update, :create, :destroy], path: 'relationships/phone'

      resources :addresses, only: [:show, :update, :create, :destroy] 
      resources :addresses, only: [:show, :update, :create, :destroy], path: 'relationships/addresses' 
    end
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
