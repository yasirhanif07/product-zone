class Subcategory < ApplicationRecord
  include HasFriendlyId

  belongs_to :category
  has_many   :subcategory_brands, dependent: :destroy
  has_many   :brands, through: :subcategory_brands

  validates :name, presence: true, uniqueness: true
  scope :subcategory_by_product, ->(product) {joins(:brands=>:products).where("products.id = ?", product)&.last}
end
