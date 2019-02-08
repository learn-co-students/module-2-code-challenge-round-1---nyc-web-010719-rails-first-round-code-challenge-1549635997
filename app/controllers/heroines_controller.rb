class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    if params[:q]
      @heroines = @heroines.select {|heroine| heroine.power.name == params[:q]}
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def edit
    @heroine = Heroine.find(params[:id])
  end

  def update
    @heroine = Heroine.find(params[:id])
    @heroine.update(heroine_params)
    if @heroine.valid?
      redirect_to @heroine
    else
      redirect_to edit_heroine_path
    end
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine = Heroine.create(heroine_params)
      redirect_to @heroine
    else
      redirect_to new_heroine_path
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
