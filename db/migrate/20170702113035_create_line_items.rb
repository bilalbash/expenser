class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.integer :price
      t.string :item_name
      t.string :category_name
      t.references :category, foreign_key: true
      t.references :item, foreign_key: true
      t.string :quantity_type
      t.string :quantity_count

      t.timestamps
    end
  end
end
