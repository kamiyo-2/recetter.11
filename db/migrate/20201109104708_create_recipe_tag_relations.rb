class CreateRecipeTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_tag_relations do |t|

      t.timestamps
    end
  end
end
