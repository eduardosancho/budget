class Operation < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_decimal: true, greater_than: 0 }
  validates :categories, presence: true
end
