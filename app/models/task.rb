class Task < ApplicationRecord
  belongs_to :user, optional: true
  attr_accessor :task_tag_ids
  has_many :task_tag_with_tasks, dependent: :delete_all
  has_many :task_tags, through: :task_tag_with_tasks
  
  validates_presence_of :title, :content
  default_scope { order(created_at: :desc) }
  scope :order_by_finish_time, -> { order(finish_time: :desc) }
  scope :order_by_priority, -> { order(priority: :desc) }
  scope :find_task_tags, -> ( task_id ){ includes(:task_tags).where(task_tags: { id: task_id }) }

  def self.get_search_tasks(search_status , search_word = nil)
    if search_status == "all" || search_status == nil
      tasks = self.all
    else
      tasks = self.where( status: search_status )
    end
    tasks = tasks.where( "title LIKE ? OR content LIKE ? ", "%#{search_word}%",  "%#{search_word}%" ) if search_word.present?
    tasks
  end

  def get_status
    case status
    when "pendding"
      "待處理"
    when "processing"
      "處理中"
    when "finished"
      "已處理"
    end
  end
  
  
end