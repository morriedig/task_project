Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tasks
  resources :task_tags, only: [:show]
  resources :users, except: [ :destroy, :index ]
  get "login" => "login#new"
  post "login" => "login#create"
  delete "logout" => "login#destroy"

  namespace :admin do
    resources :users
    root "users#index"
  end

  root "tasks#index"
  match '*path' => "application#render_404", via: [:get, :put, :post, :delete, :options]
end
