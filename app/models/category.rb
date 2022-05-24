class Category < ApplicationRecord
  belongs_to :user, class_name: 'User'

  has_many :categorizations, dependent: :destroy
  has_many :operations, through: :categorizations, dependent: :destroy

  validates :name, presence: true
end
