class Operation < ApplicationRecord 
  belongs_to :author, class_name: 'User'

  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :name, presence: true
end
