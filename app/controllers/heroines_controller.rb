class HeroinesController < ApplicationController

###I realize this is a super messy way of doing the search function..but it works, can/should definitely refactor in some way. Also ideally would have an error message when no results found.

  def index
    if params[:option] == "flight"
      @heroines = Heroine.all.select do |heroine|
        heroine.power_name == "flight"
      end
    elsif params[:option] == "super strength"
      @heroines = Heroine.all.select do |heroine|
        heroine.power_name == "super strength"
      end
    elsif params[:option] == "super human senses"
      @heroines = Heroine.all.select do |heroine|
        heroine.power_name == "super human senses"
      end
    elsif params[:option] == "elasticity"
      @heroines = Heroine.all.select do |heroine|
        heroine.power_name == "elasticity"
      end
    else
      @heroines = Heroine.all
  end
end

  def new
    @heroine = Heroine.new(params[:id])
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
    @heroine = Heroine.find(params[:id])
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :power_name)
  end

end
