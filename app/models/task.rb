class Task < ApplicationRecord
  validates_presence_of :title, :content
  default_scope { order(created_at: :desc) }
end
