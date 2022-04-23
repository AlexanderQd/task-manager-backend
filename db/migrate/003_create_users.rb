class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, index: true, unique: true
      t.string :password_digest
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
