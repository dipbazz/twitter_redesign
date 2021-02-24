class UsersController < ApplicationController
  before_action :authenticate_user!

  def follow
    user = User.find(params[:id])
    @following = current_user.followed_users.build(followed: user)

    if @following.save
      flash[:notice] = "You are now following @#{user.username}."
    else
      flash[:alert] = "Something went wrong while trying to follow the user."
    end

    redirect_to opinions_path
  end

  def unfollow
    user = User.find(params[:id])
    @following = current_user.followed_users.find_by(followed: user)

    if @following.destroy
      flash[:alert] = "You have unfollowed @#{user.username}."
    else
      flash[:alert] = "Something went wrong while trying to follow the user."
    end

    redirect_to opinions_path
  end
end
