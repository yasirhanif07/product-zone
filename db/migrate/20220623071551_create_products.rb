class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string     :name
      t.string     :video_id
      t.string     :description
      t.string     :slug
      t.integer    :viewed_count, default: 0
      t.references :brand

      t.timestamps
    end
  end
end
