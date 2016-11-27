Rails.application.routes.draw do

  scope :authentication do
    get 'login', to: 'authentication#login', as: :login
    get 'logout', to: 'authentication#logout', as: :logout
    post 'auth', to: 'authentication#auth', as: :auth
  end

  resources :switches
  resources :users
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
