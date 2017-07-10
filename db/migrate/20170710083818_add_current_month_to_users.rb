class AddCurrentMonthToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :current_month, :string
  end
end
