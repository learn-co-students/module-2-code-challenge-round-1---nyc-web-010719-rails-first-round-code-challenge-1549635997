class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all

    if params[:super_power]
      @heroines = @heroines.select do |heroine|
        heroine.power.name == params[:super_power]
      end
      @heroines
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(strong_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      redirect_to new_heroine_path
    end
  end


  private
  def strong_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
