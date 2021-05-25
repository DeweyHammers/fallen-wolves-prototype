Rails.application.routes.draw do
  resources :posts do 
    resources :comments
  end
  resources :members
  
  root 'application#home'
  get '/login' => 'sessions#new' 
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destory'
  get '/auth/:provider/callback', to: 'sessions#omniauth'
end
