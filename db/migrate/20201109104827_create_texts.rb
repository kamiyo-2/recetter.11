class CreateTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :texts do |t|
      t.text        :text,   null: false    
      t.string      :text_image_id        
      t.references  :recipe, foreign_key: true 
      t.timestamps
    end
  end
end
