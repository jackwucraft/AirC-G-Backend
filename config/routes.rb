Rails.application.routes.draw do
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  Rails.application.routes.draw do
    namespace :api, defaults: { format: :json } do
      namespace :v1 do
        post 'login', to: 'sessions#login', as: :login
        resources :games, only: %i[index show create update]
      end
    end
  end
end
