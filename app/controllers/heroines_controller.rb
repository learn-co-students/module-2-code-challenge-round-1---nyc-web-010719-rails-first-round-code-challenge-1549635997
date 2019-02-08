class HeroinesController < ApplicationController
  def index
    if params[:term]
      @power_search = Power.find_by(name: params[:term]).id
      @heroines = Heroine.where('power_id LIKE ?', "#{@power_search}")
    else
      @heroines = Heroine.all
    end
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def create
    @heroine = Heroine.new(heroine_params)

    if @heroine.valid?
      @heroine.save
      flash[:notice] = "#{@heroine.super_name} has been supersaved!"
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :term)
  end
end
