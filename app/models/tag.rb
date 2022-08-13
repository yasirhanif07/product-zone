class Tag < ApplicationRecord
  include HasFriendlyId

  has_many :product_tags
  has_many :products, through: :product_tags

  validates :name, presence: true, uniqueness: true
end
