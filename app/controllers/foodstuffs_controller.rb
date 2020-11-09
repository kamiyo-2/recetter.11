class FoodstuffsController < ApplicationController
  

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @foodstuffs = Foodstuff.where(recipe_id: @recipe.id).order(:position)
    @foodstuff = Foodstuff.new
  end


    def create
      @foodstuff = Foodstuff.new(foodstuff_params)
      if @foodstuff.save
        redirect_to edit_recipe_path(@recipe.id)
      else
        @recipe = @foodstuff.recipe
        @foodstuffs = @recipe.texts
        render :edit
      end
    end
  
    def update
      @foodstuff = Foodstuff.find(params[:id])
      @foodstuffs = @recipe.texts.all
      @recipe = Recipe.find(params[:recipe_id])
      flash.now[:update] = 'UPDATE !' if @foodstuff.update(foodstuff_params)
    end
  
    private
    def foodstuff_params
      params.require(:foodstuff).permit(:material, :quantity).merge(recipe_id: params[:recipe_id])
    end
end
