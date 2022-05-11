class Character < ApplicationRecord
  has_many :comic_characters
  has_many :comics, :through => :comic_characters
end
