class RecipesController  < ApplicationController
  def index
    @recipes = Recipe.all
  end
  
  def show
    #binding.pry
    @recipe = Recipe.find(params[:id])
  end
  
end