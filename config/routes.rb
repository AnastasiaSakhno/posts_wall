Rails.application.routes.draw do
  get 'users/log_in'
  get 'users/sign_up'

  resources :users, only: [:create]
end
