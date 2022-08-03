class AddUserDescription < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :description, :text, null: false, default: ''
  end
end
