Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "signin", to: "users#create"
      post "login", to: "sessions#create"
      resources :websites, only: [ :index, :show, :create, :update, :destroy ]

      resources :protected_resource, only: [ :index ], constraints: lambda { |request| request.format == :json }
    end
  end
  post "auth/:provider/callback", to: "api/v1/users#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
