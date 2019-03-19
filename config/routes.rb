Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tasks
  resources :users, except: [ :destroy, :index ]

  root "tasks#index"
end
