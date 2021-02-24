class OpinionsController < ApplicationController
  before_action :authenticate_user!

  def follow
    user = User.find(params[:id])
    @following = current_user.follow.build(follower: current_user)

    if @following.save
      flash[:notice] = "You are now following ."
    else
      flash[:alert] = "Something went wrong while creating your opinion."
    end

    redirect_to opinions_path
  end
end
