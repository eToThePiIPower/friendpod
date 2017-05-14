class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend_id])
    if current_user.requested_friends.include? friend
      current_user.accept_request friend
      redirect_to friends_path(friend_id: friend.id)
    else
      current_user.friend_request friend
      redirect_to matches_path
    end
  end

  def show
    if current_user.friends.include? User.find_by(id: params[:friend_id])
      @friend = User.find_by(id: params[:friend_id])
    end
  end
end
