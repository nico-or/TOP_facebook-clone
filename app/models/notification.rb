class Notification < ApplicationRecord
  validates_presence_of :user
  validates_presence_of :notificable

  belongs_to :user
  belongs_to :notificable, polymorphic: true

  enum :status, [:unread, :read]
end
