class AddHeightToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :height, :decimal
  end
end
