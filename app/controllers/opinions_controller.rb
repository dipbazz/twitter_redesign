class OpinionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @opinions = Opinion.all
    @opinion = Opinion.new
  end

  def create
    @opinion = current_user.opinions.build(opinion_params)

    if @opinion.save
      flash[:notice] = 'Your opinion has been created.'
    else
      flash[:alert] = 'Something went wrong while creating your opinion.'
    end

    redirect_to opinions_path
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
