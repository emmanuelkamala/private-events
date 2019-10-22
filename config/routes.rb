Rails.application.routes.draw do
  root 'events#home'
  
  get 'admin', :to => 'access#menu'
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'
 
  resources :events do 
    member do
     get :delete
     get :showhome
    end
  end
  resources :users
  
end
