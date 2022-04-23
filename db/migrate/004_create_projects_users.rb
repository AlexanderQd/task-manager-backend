class CreateProjectsUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :projects_users do |t|
      t.integer :user_id, foreign_key: true, index: true
      t.integer :project_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
