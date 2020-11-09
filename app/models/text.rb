class Text < ApplicationRecord
  attachment :text_image
  belongs_to :recipe
end
