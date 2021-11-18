class AddWeightToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :weight, :decimal
  end
end
