class LoginsController < ApplicationController

  def new

  end
  
  # can use local variable since no Model needs an @instance variable
  def create
    chef = Chef.find_by(email: params[:email])
    if chef && chef.authenticate(params[:password])
      session[:chef_id] = chef.id
      flash[:success] = "You logged in successfully"
      redirect_to recipes_path
    else
      flash.now[:danger] = "You email or password does not match, try again"
      render 'new'        # send them back to /new
    end    
  end
  
  def destroy
    session[:chef_id] = nil
    flash[:success] = "You have successfully logged out"
    redirect_to root_path
  end

end