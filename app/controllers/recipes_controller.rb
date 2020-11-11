class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      @recipe[:id]
      redirect_to new_recipe_foodstuff_path(@recipe.id)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @text = Text.new
    @texts = @recipe.texts
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs
  end



  def edit
    @recipe = Recipe.find(params[:id])
    @text = Text.new
    @texts = @recipe.texts
    @foodstuff = Foodstuff.new
    @foodstuffs = @recipe.foodstuffs
  end

  

    private
  def recipe_params
    params.require(:recipe).permit(:title, :process, :details, :main_image, tag_ids: []).merge(user_id: current_user.id)
  end

end
