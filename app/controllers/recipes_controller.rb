class RecipesController  < ApplicationController
 
  def index
    @recipes = Recipe.all
  end
  
  def show
    #binding.pry
    @recipe = Recipe.find(params[:id])
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(2) # hardcode for the time being since every recipe needs a chef id!!!
    
    if @recipe.save
      #do something
      flash[:success] = "You've successfully created a new recipe"
      redirect_to recipes_path   # that's the index action
    else
      render :new
    end
  end
  
  def update
  end
  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description)
    end
end