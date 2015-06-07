class RecipesController  < ApplicationController
 
  def index
    @recipes = Recipe.all.sort_by{|likes| likes.thumbs_up_total}.reverse
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
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      #do something
      flash[:success] = "You've successfully this recipe"
      redirect_to recipe_path(@recipe)         # that the "show" path!
    else
      render :edit                            # take them back to edit form
    end
  end
  
  def like
    @recipe = Recipe.find(params[:id])
    like = Like.create(like: params[:like], chef: Chef.first, recipe: @recipe)
    if like.valid?
      flash[:success] = "You recipe was updated successfully"
      redirect_to :back
    else
      flash[:danger] = "You can only like/dislike a recipe once! Sorry."
      redirect_to :back    
    end
  end

  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture)
    end
end