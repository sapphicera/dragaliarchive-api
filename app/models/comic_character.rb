class ComicCharacter < ApplicationRecord
  belongs_to :character
  belongs_to :comic
end
