class Post < ApplicationRecord
  validates_presence_of :body

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  scope :newest_first, -> { order(updated_at: :desc) }
  scope :oldest_first, -> { order(updated_at: :asc) }
end
