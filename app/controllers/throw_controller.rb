# This file is called throw_controller.rb
# It contains the class SimpleNumber
class ThrowController < ApplicationController
  def play
    @results = Game.new(params[:sign]).results
    render :index
  end

  def index
  end
end
