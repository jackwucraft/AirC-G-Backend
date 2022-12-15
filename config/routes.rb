# root to: "pages#home"
# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

# Defines the root path route ("/")
# root "articles#index"
Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'login', to: 'sessions#login', as: :login
      get "users/:user_id/likes", to: 'likes#show'
      get "users/:user_id/bookings", to: 'bookings#index'
      post "products/:product_id/likes", to: 'likes#create_or_destroy'
      post "products/:product_id/:user_id/bookings", to: 'bookings#create'
      resources :users, only: %i[show update]
      resources :products, only: %i[index show create update destroy]
    end
  end
end
