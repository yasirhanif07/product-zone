class Category < ApplicationRecord
  include HasFriendlyId

  has_many :subcategories, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  scope :category_by_brand, ->(brand) {joins(:subcategories => :brands).where("brands.id = ?", brand)&.last}
end
