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
      resources :class_room
      resources :student
      resources :teacher
    end
  end
end
