class TasksController < ApplicationController

  def index
    @user = current_user
    @tasks = @user.tasks.where(completion_at:nil).order(:deadline_at) #最終的にはcurrent_userだけのtask一覧にしたい…
    @tasks_done = @user.tasks.where.not(completion_at:nil)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    
    @totalExp = current_user.experience_point
    
      if params[:task][:importance] == "0"
        @totalExp += 10
      elsif params[:task][:importance] == "1"
        @totalExp += 15
      elsif params[:task][:importance] == "2"
        @totalExp += 5
      else
      end
    current_user.experience_point = @totalExp
    current_user.update(experience_point: @totalExp)
    
    @task.save
    redirect_to tasks_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.user_id = current_user.id
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def done
    @today = Date.today
    @task = Task.find(params[:id])
    
    @totalExp = current_user.experience_point


    @level_set = LevelSet.find_by(level: current_user.level + 1)

    if @level_set.thresold <= current_user.experience_point
      current_user.level = current_user.level + 1
      current_user.update(level: current_user.level)
    end

    @task.update(completion_at: @today)
    redirect_to :action => "index"
  end

  private
  def task_params
    params.require(:task).permit(:text, :deadline_at, :importance, :completion_at)
  end

end
