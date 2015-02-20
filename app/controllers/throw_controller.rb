class ThrowController < ApplicationController
  def play
    @results = Game.new(params[:sign]).results
    render :index
  end

  def index
  end
end
