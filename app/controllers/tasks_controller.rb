class TasksController < ApplicationController

  def index
    @tasks = Task.get_search_tasks( params[:search_status], params[:search_word]).page(params[:page]).per(1)
  end

  def show
    find_task
  end

  def new
    @task = Task.new    
  end
  
  def create
    @task = Task.new( task_params )
    if @task.save
      redirect_to tasks_path, notice: "任務新增成功!"
    else
      render :new
    end
  end
  

  def edit
    find_task
  end

  def update
    find_task
    @task.update(task_params)
    redirect_to tasks_path, notice: "任務更新成功!"
  end
  

  def destroy
    find_task
    @task.destroy if @task
    redirect_to tasks_path, notice: "任務已刪除!"
  end

  private
  def find_task
    @task = Task.find_by_id(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :content, :status, :priority, :finish_time)
  end
  
  

end
