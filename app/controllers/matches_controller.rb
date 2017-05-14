class MatchesController < ApplicationController
  acts_as_token_authentication_handler_for User

  def index
    @matches = current_user.find_related_interests

    respond_to do |format|
      format.html { }
      format.json { render json: @matches }
    end
  end
end
