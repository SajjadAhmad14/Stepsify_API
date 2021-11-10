class CreateActivityStats < ActiveRecord::Migration[6.1]
  def change
    create_table :activity_stats do |t|
      t.decimal :steps
      t.integer :user_id

      t.timestamps
    end
  end
end
