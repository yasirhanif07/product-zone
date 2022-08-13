class Brand < ApplicationRecord
  include HasFriendlyId

  has_many :subcategory_brands, dependent: :destroy
  has_many :subcategories, through: :subcategory_brands
  has_many :products, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  validate :has_one_subcategory_at_least

  def has_one_subcategory_at_least
    if subcategories.empty?
      errors.add(:brand, "need one subcategory at least")
    end
  end
end
