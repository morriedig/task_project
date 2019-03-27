class TaskTagsController < ApplicationController
  def show
    @task_tag = TaskTag.find_by_id( params[:id] )
    @tasks = current_user.tasks.find_task_tags(@task_tag.id).get_search_tasks( params[:search_status], params[:search_word]).page(params[:page]).per(5)
    @task_tags = TaskTag.all
  end
end
