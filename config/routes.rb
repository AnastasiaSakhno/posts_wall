Rails.application.routes.draw do
  get 'users/log_in'
  get 'users/sign_up'
  get 'users/authenticate'
  get 'user/profile'

  resources :users, only: [:create]
end
