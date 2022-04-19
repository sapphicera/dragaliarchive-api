class Alliance < ApplicationRecord
  has_many :users
  validates_length_of :users, maximum: 4

  validates :name, presence: true
  validates :description, length: { within: 10..15 }, presence: true
end