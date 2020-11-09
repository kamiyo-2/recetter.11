class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      @recipe[:id]
      redirect_to edit_recipe_path(@recipe.id)
    else
      render :new
    end
  end
  



  def edit
    @recipe = Recipe.find(params[:id])
    @text = Text.new
    @texts = @recipe.texts
  end

  

    private
  def recipe_params
    params.require(:recipe).permit(:title, :process, :material, :main_image, tag_ids: []).merge(user_id: current_user.id)
  end

end
