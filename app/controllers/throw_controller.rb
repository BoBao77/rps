# This file is called throw_controller.rb
# It contains the class SimpleNumber
class ThrowController < ApplicationController
  def play
    @results = Game.new(params[:sign]).results
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @results }
    end
  end

  def index
  end
end
