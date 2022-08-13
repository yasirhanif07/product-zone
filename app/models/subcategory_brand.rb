class SubcategoryBrand < ApplicationRecord
  belongs_to :subcategory
  belongs_to :brand
end
