class Task < ApplicationRecord
  validates_presence_of :title, :content
  default_scope { order(created_at: :desc) }
  scope :order_by_finish_time, -> { order(finish_time: :desc) }
end
