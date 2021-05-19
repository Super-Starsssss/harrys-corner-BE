Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :account_activations, only: :edit
      resource :users, only: %i(create show)
      post "/login", to: "sessions#create"
      delete "/logout", to: "sessions#destroy"
      resources :topics, only: %i(index)
      resources :collections, only: %i(index)
      resources :questions, only: %i(index show)
      resources :topic do
        resources :questions
      end

      namespace :admin do
        resources :dashboards, only: %i(index)
        resources :users
      end
      resources :class_rooms, only: %i{ index show create update destroy }

      resources :class_users, only: %i{index create}
      get "/class_users/search", to: "class_users#search_user"
    end
  end
end
