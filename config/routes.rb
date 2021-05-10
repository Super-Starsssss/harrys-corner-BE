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

      resources :class_rooms
      get "class_rooms/delete/:id", to: "class_rooms#delete_class"
      resources :student_classes
      get "student_classes/delete/:id", to: "student_classes#delete_student"
    end
  end
end
