Rails.application.routes.draw do
  devise_ios_rails_for :users

  get 'matches', to: 'matches#index'

  post 'friends', to: 'friendships#create'
  get 'friends', to: 'friendships#show'

  get 'ncco', to: 'nccos#generate_ncco'
  post 'ncco', to: 'nccos#setup_call'
  post 'sms', to: 'nccos#send_text'

  root to: 'static_pages#home'
end
