class TaskTag < ApplicationRecord
  has_many :task_tag_with_tasks
  has_many :tasks, through: :task_tag_with_tasks
end
