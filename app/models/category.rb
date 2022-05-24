class Category < ApplicationRecord
  belongs_to :user

  has_many :categorizations
  has_many :operations, through: :categorizations

  validates :name, presence: true
end
