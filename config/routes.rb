Rails.application.routes.draw do
  devise_ios_rails_for :users

  get 'matches', to: 'matches#index'
end
