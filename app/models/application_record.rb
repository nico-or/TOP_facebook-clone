class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  scope :newest_first, -> { order(updated_at: :desc) }
  scope :oldest_first, -> { order(updated_at: :asc) }
end
