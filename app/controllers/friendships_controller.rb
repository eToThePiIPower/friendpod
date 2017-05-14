class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend_id])
    if current_user.requested_friends.include? friend
      current_user.accept_request friend
    else
      current_user.friend_request friend
    end
    redirect_to root_path
  end
end
