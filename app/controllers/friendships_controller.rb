class FriendshipsController < ApplicationController
  def create
    friend = User.find(params[:friend_id])
    if current_user.friends.include? friend
      render :show, friend_id: friend.id
    elsif current_user.requested_friends.include? friend
      current_user.accept_request friend
      render :show, friend_id: friend.id
    else
      current_user.friend_request friend
      redirect_to matches_path
    end
  end

  def show
    friend = User.find(params[:friend_id]) 
    if current_user.friends.include? friend
      @friend = friend
    end
  end
end
