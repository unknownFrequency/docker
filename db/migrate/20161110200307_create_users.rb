class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :address
      t.integer :zip, limit: 4
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
