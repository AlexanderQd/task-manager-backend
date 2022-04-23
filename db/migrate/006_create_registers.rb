class CreateRegisters < ActiveRecord::Migration[7.0]
  def change
    create_table :registers do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :task_id, index: true, foreign_key: true
      t.integer :user_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
