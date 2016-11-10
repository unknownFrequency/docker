class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    if table_exists?("users")
      drop_table :users
    end
  end
end
