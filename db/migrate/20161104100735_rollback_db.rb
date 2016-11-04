class RollbackDb < ActiveRecord::Migration[5.0]
  def change
    drop_table :inquiries

    create_table :inquiries do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
