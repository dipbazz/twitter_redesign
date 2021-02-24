class UsersController < ApplicationController
  before_action :authenticate_user!, :set_user

  def show
    @user = User.includes(:opinions).find(params[:id])
  end

  def follow
    @following = current_user.followed_users.build(followed: @user)

    if @following.save
      flash[:notice] = "You are now following @#{@user.username}."
    else
      flash[:alert] = 'Something went wrong while trying to follow the user.'
    end

    redirect_to request.referrer
  end

  def unfollow
    @following = current_user.followed_users.find_by(followed: @user)

    flash[:alert] = if @following.destroy
                      "You have unfollowed @#{@user.username}."
                    else
                      'Something went wrong while trying to unfollow the user.'
                    end

    redirect_to request.referrer
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
