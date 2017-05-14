Rails.application.routes.draw do
  devise_ios_rails_for :users

  get 'matches', to: 'matches#index'
  post 'friends', to: 'friendships#create'

  root to: 'static_pages#home'
end
