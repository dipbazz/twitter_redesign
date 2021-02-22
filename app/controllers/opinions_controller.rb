class OpinionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @opinion = Opinion.all
  end
end
