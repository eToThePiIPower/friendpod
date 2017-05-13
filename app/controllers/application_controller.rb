class ApplicationController < ActionController::Base
  respond_to :html, :json
  acts_as_token_authentication_handler_for User
end
