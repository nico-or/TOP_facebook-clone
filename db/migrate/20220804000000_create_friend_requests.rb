class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.references :sender, foreign_key: { to_table: :users }
      t.references :receiver, foreign_key: { to_table: :users }
      t.integer :status, default: 0, null: false

      t.index [:sender_id, :receiver_id], unique: true

      t.timestamps
    end
  end
end
