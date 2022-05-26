class Category < ApplicationRecord
  belongs_to :user, class_name: 'User'

  has_many :categorizations, dependent: :destroy
  has_many :operations, through: :categorizations, dependent: :destroy

  has_one_attached :icon, dependent: :destroy
  validate :acceptable_icon

  validates :name, presence: true

  def acceptable_icon
    return unless icon.attached?

    errors.add(:icon, 'is too big') unless icon.byte_size <= 1.megabyte

    acceptable_types = ['image/jpeg', 'image/png']
    errors.add(:icon, 'must be a JPEG or PNG') unless acceptable_types.include?(icon.content_type)
  end

  def category_name
    name.to_s
  end

  def recent_transactions
    operations.order(created_at: :desc)
  end
end
