class TasksController < ApplicationController

  def index
    @tasks = Task.all #最終的にはcurrent_userだけのtask一覧にしたい…
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.save
    redirect_to tasks_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def task_params
    params.require(:task).permit(:text, :deadline_at, :importance)
  end

end
