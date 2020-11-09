class Tag < ApplicationRecord
  has_many :recipe_tag_relations, dependent: :destroy
  belongs_to :recipe, optional: true
end
