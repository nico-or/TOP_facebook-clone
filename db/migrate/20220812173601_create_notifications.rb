class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.integer :status, default: 0, null: false

      t.references :user, null: false
      t.references :notificable, polymorphic: true

      t.timestamps
    end
  end
end
