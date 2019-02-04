Rails.application.routes.draw do
  devise_for :users

  get '/home', to: 'posts#home'

  root 'posts#home'

  resources :posts do
    resources :comments
  end

end
