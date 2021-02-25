class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(opinion_id: params[:opinion_id])

    if @like.save
      flash[:notice] = 'You liked an opinion.'
    else
      flash[:alert] = 'You cannot like this opinion.'
    end
    redirect_to opinions_path
  end

  def destroy
    like = Like.find_by(id: params[:id], user: current_user, opinion_id: params[:opinion_id])
    if like
      like.destroy
      flash[:notice] = 'You disliked an opinion.'
    else
      flash[:alert] = 'You cannot dislike opinion that you did not like before.'
    end
    redirect_to opinions_path
  end
end
