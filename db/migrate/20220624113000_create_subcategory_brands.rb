class CreateSubcategoryBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :subcategory_brands do |t|
      t.references :brand,       index: true, foreign_key: true
      t.references :subcategory, index: true, foreign_key: true

      t.timestamps
    end
  end
end
