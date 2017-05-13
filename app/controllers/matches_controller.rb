class MatchesController < ApplicationController
  acts_as_token_authentication_handler_for User

  def index
    render json: current_user.find_related_interests
  end
end
