class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.integer :price
      t.string :item_name
      t.string :category_name
      t.integer :category_id, foreign_key: true
      t.integer :item_id, foreign_key: true
      t.string :quantity_type
      t.string :quantity_count
      t.date :purchase_date

      t.timestamps
    end
  end
end
