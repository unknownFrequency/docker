class CreateInquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :inquiries do |t|
      t.string :type
      t.integer :user_id
      t.date :fly_date
      t.float :longitude
      t.float :aptitide

      t.timestamps
    end
  end
end
