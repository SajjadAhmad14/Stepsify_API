Rails.application.routes.draw do
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
  resources :activities, except: :index
  resources :activity_stats, only: [:create, :update, :destroy]
  get "/:id/targets", to: "activities#targets"
  get "/:id/user_stats", to: "activity_stats#user_stats"
end
