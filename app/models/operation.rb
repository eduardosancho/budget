class Operation < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations, dependent: :destroy

  after_save :update_operations_counter

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_decimal: true, greater_than: 0 }
  validates :categories, presence: true

  private

  def update_operations_counter
    @category = categories[0]
    @category.update_attribute(:operations_counter, @category.operations_counter += 1)
  end
end
