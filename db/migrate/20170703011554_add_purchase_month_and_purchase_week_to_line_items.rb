class AddPurchaseMonthAndPurchaseWeekToLineItems < ActiveRecord::Migration[5.1]
  def change
    add_column :line_items, :purchase_week, :integer
    add_column :line_items, :purchase_month, :string
  end
end
