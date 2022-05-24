class Operation < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations, dependent: :destroy

  validates :name, presence: true
end
