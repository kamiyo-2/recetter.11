class TextsController < ApplicationController
  
  def create
    @text = Text.new(text_params)
    if @text.save
      redirect_to recipe_path(@text.recipe)
    else
      @recipe = @text.recipe
      @texts = @recipe.texts
      render "recipes/show"
  end
  end

  private
  def text_params
    params.require(:text).permit(:text, :text_image).merge(recipe_id: params[:recipe_id])
  end
end
