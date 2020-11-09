class Recipe < ApplicationRecord
  attachment :main_image
  has_many :recipe_tag_relations, dependent: :destroy
  has_many :tags, through: :recipe_tag_relations
  has_many :texts
  has_many :foodstuffs
  belongs_to :user


  validates :title, :details, :process, :main_image_id, 
  　　　　　　 presence: true
end