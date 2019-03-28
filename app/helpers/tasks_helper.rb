module TasksHelper

  def priority(task)
    if task.priority === 3
      "高"
    elsif task.priority === 2
      "中"
    else
      "低"
    end
  end
  
  def status(task)
    case task.status
    when "pending"
      "待處理"
    when "processing"
      "處理中"
    when "finished"
      "已處理"
    else
      "未分類"
    end
  end
end
