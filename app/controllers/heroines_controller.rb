class HeroinesController < ApplicationController

### Could not get search to work exactly how I wanted.. wanted to give "no results found" message to user if @heroines was empty but couldn't get it to work in time. Because of this I added a "reload all heroines" button in index.erb so you could reset searches that return 0 Heroines.

  def index
    if params[:option]
      @heroines = Heroine.all.select do |heroine|
      heroine.power_name == params[:option]
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
