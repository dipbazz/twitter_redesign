class OpinionsController < ApplicationController

  def index
    @opinion = Opinion.all
  end
end
