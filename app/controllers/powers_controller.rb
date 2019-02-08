class PowersController < ApplicationController
  
  def index
    @powers = Power.all
  end

  def new
    @power = Power.new(params[:id])
  end

  def show
    @power = Power.find(params[:id])
  end

end
