class PowersController < ApplicationController
  before_action :find_power, only: [:show, :edit, :update, :destroy]

  def index
    @powers = Power.all
  end

  def new
    @power = Power.new
  end

  def create
    @power = power.new(power_params)
    if @power.valid?
      @power.save
      redirect_to @power
    else
      flash[:errors] = @power.errors.full_messages
      redirect_to new_power_path
    end
  end


  def show
  end

  def edit
  end

  def update
    @power.update(power_params)
    if @power.valid?
      redirect_to @power
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def power_params
    params.require(:power).permit(:name, :description)
  end

  def find_power
    @power = Power.find(params[:id])
  end

end
