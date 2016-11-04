class CreateInquiries < ActiveRecord::Migration[5.0]
  def change
    def up
      create_table :inquiries do |t|
        t.string :title
        t.text :body

        t.timestamps
      end
    end

    def down
      drop_table :inquiries
    end

  end
end
