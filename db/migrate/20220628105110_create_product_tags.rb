class CreateProductTags < ActiveRecord::Migration[6.1]
  def change
    create_table :product_tags do |t|
      t.references :tag
      t.references :product

      t.timestamps
    end
  end
end
