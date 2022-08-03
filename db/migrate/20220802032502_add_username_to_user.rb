class AddUsernameToUser < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :username, :string, unique: true

    execute <<~SQL
    UPDATE users SET username = email;
    SQL

    change_column_null :users, :username, false
  end

  def down
    remove_column :users, :username
  end
end
