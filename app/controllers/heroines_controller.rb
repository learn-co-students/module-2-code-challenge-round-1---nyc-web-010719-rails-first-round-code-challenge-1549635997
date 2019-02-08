class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show, :edit, :update, :destroy]

  def index
    @heroines = if params[:search_term]
          Heroine.where(power_name: "%#{params[:search_term]}%")
        else
          Heroine.all
        end
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end


  def show
  end

  def edit
  end

  def update
    @heroine.update(employee_params)
    if @heroine.valid?
      redirect_to @heroine
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :search_term)
  end

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

end
