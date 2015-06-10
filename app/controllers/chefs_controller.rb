class ChefsController  < ApplicationController

  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 3)
  end
  
  def new
    # register will get handed create action
    @chef = Chef.new
  end
  
  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "Your account has been created succesfully"
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  
  def edit
    # will get handled by the update action
    @chef = Chef.find(params[:id])
  end
  
  def update
    @chef = Chef.find(params[:id])
    if @chef.update(chef_params)
      flash[:success] = "Your profile has been succesfully updated!"
      redirect_to recipes_path #TODO: chenge to show page once we get there
    else
      render 'edit'
    end
  end
  
  def show
    @chef = Chef.find(params[:id])
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 3)
  end
  

private
  def chef_params
    params.require(:chef).permit(:chefname, :email, :password)
  end
end