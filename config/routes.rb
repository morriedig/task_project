Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tasks
  resources :users, except: [ :destroy, :index ]
  get "login" => "login#new"
  post "login" => "login#create"
  delete "logout" => "login#destroy"

  root "tasks#index"
end
