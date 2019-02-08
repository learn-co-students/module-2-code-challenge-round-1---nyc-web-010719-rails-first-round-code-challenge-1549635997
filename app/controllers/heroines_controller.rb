class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all

  end

  def show
    @heroine = Heroine.find(params[:id])
    @power = @heroine.power
  end

  def new
    @heroine = Heroine.new
    # redirect_to new_heroine_path
  end

  def create
    @heroine = Heroine.new(heroine_params)
    @heroine.save
    redirect_to @heroine
  end

  def search
    @power = Heroine.power
    if params[:search] == "super strength"
  
    elsif params[:search] == "flight"

    elsif params[:search] == "super human senses"

    elsif params[:search] == "elasticty"

    else
      render :index
    end

  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end



end
