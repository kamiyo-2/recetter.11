class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name, null:false
      t.references :recipe, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
