class CreateSubcategories < ActiveRecord::Migration[6.1]
  def change
    create_table :subcategories do |t|
      t.string     :name
      t.string     :slug
      t.string     :description
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
