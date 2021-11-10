class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.decimal :target
      t.integer :user_id

      t.timestamps
    end
  end
end
