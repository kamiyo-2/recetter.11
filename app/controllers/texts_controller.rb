class TextsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foodstuffs = Foodstuff.where(recipe_id: @recipe.id)

    @texts = Text.where(recipe_id: @recipe.id).order(:position)
    @text = Text.new
  end




  def create
    @text = Text.new(text_params)
    if @text.save
      
      redirect_to recipe_path(@text.recipe_id), method: :get
    else
      @recipe = @text.recipe
      @texts = @recipe.texts
      render "recipes/show"
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    redirect_to root_path if current_user.id != @recipe.user_id
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


