class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def follower
    @user = User.find(params[:user_id])
    @followers = @user.followers
  end

  def following
    @user = User.find(params[:user_id])
    @following = @user.follows
  end
end
