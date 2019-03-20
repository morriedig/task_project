class Task < ApplicationRecord
  # belongs_to :user
  has_many :task_tag_with_tasks
  has_many :task_tags, through: :task_tag_with_tasks
  
  validates_presence_of :title, :content
  default_scope { order(created_at: :desc) }
  scope :order_by_finish_time, -> { order(finish_time: :desc) }
  scope :order_by_priority, -> { order(priority: :desc) }

  def self.get_search_tasks(search_status , search_word = nil)
    if search_status == "all" || search_status == nil
      tasks = self.all
    else
      tasks = self.where( status: search_status )
    end
    tasks = tasks.where( "title LIKE ? OR content LIKE ? ", "%#{search_word}%",  "%#{search_word}%" ) if search_word.present?
    tasks
  end
  
end