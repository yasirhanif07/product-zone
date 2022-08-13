class Product < ApplicationRecord
  include HasFriendlyId

  has_one_attached :image
  belongs_to :brand
  has_many :product_tags
  has_many :tags, through: :product_tags

  validates :name, presence: true, uniqueness: true

end
