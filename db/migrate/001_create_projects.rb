class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.integer :client_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
