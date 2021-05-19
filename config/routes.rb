Rails.application.routes.draw do
  
  get "/login" to: "sessions#create"
  namespace :api do
    namespace :v1 do
      resources :users
      resources :categories
      resources :lists
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
