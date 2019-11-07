Rails.application.routes.draw do
  root 'events#index'
  
  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'login', :to => 'access#login'
  post 'login', :to => 'access#attempt_login'
  get 'logout', :to => 'access#logout'
  get 'signup', :to => 'users#new'
  get 'home', :to => 'events#home'
 
  resources :events do 
    member do
     get :delete
     get :showhome
    end
    resources :event_attendances do
      get :delete
    end
  end
  resources :users
  
end
