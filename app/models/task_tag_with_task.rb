class TaskTagWithTask < ApplicationRecord
  belongs_to :task_tag
  belongs_to :task
end
