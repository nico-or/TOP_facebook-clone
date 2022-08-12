class Notification < ApplicationRecord
  belongs_to :notificable, polymorphic: true

  enum :status, [:unread, :read]
end
