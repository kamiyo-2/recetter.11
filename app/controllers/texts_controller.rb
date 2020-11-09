class TextsController < ApplicationController
  
  def create
    @text = Text.new(text_params)
    if @text.save
      redirect_to edit_recipe_path(@recipe.id)
    else
      @recipe = @text.recipe
      @texts = @recipe.texts
      render "recipes/show"
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @text = Text.new
    @texts = Text.where(recipe_id: @recipe.id).order(:position)
  end

  def update
    @text = Text.find(params[:id])
    @texts = @recipe.texts.all
    @recipe = Recipe.find(params[:recipe_id])
    flash.now[:update] = 'UPDATE !' if @text.update(text_params)
  end

  private
  def text_params
    params.require(:text).permit(:text, :text_image).merge(recipe_id: params[:recipe_id])
  end
end


