class User < ApplicationRecord
  belongs_to :alliance, optional: true
  validates_associated :alliance
end