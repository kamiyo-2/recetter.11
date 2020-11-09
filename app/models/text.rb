class Text < ApplicationRecord
  attachment :text_image
  belongs_to :recipe

  validates :text,        presence: true
  validates :text_image,     presence: true
end
