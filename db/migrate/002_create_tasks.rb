class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :project_id, foreign_key: true, index: true
      t.boolean :finished, index: true
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :status_cd, index: true

      t.timestamps
    end
  end
end
