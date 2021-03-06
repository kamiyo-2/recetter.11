class FoodstuffsController < ApplicationController
  
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foodstuffs = Foodstuff.where(recipe_id: @recipe.id).order(:position)
    @foodstuff = Foodstuff.new
  end

  

  def create
    @foodstuff = Foodstuff.new(foodstuff_params)
    if @foodstuff.save
    redirect_to new_recipe_text_path( @foodstuff.recipe_id)
    else
      @recipe = @foodstuff.recipe
      @foodstuffs = @recipe.texts
      render :edit
    end
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @foodstuffs = Foodstuff.where(recipe_id: @recipe.id).order(:position)
    @foodstuff = Foodstuff.new
  end


  
    def update
      @foodstuff = Foodstuff.find(params[:id])
      @foodstuffs = @recipe.texts.all
      @recipe = Recipe.find(params[:recipe_id])
      flash.now[:update] = 'UPDATE !' if @foodstuff.update(foodstuff_params)
    end
  
    private
    def foodstuff_params
      params.permit(:material, :quantity).merge(recipe_id: params[:recipe_id])
    end
end
