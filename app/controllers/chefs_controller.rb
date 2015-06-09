class ChefsController  < ApplicationController
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
  end
  
  def update
  end

private
  def chef_params
    params.require(:chef).permit(:chefname, :email, :password)
  end
end