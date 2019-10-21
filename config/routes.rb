Rails.application.routes.draw do
  resources :events do 
    member do
     get :delete
    end
  end
  resources :users
  # get 'events/index'
  # get 'events/show'
  # get 'events/new'
  # get 'events/create'
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
