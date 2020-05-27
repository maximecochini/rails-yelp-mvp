class Restaurant < ApplicationRecord
  has_many :reviews, foreign_key: "reference_id", dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
end
