class TasksController < ApplicationController

  def index
    @user = current_user

    @level_set = LevelSet.find_by(level: current_user.level + 1)
    @thresold = @level_set.thresold
    @progress_min = LevelSet.find_by(level: current_user.level).thresold

    @tasks = @user.tasks.where(completion_at:nil).where("deadline_at >= ?", Time.now).order(:deadline_at)
    @tasks_done = @user.tasks.where.not(completion_at:nil).page(params[:page]).per(5)

    @tasks_expired = @user.tasks.where(completion_at:nil).where("deadline_at <= ?", Time.now)

    @notifications = current_user.notifications
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end

  def sort
    @task = Task.find(params[:task_id])
    @task.update(task_params)
    render nothing: true
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
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
    @now = Time.now
    @task = Task.find(params[:id])
    @totalExp = current_user.experience_point

      if@task.importance == "middle"
        @totalExp += 10
      elsif @task.importance == "high"
        @totalExp += 15
      elsif @task.importance == "low"
        @totalExp += 5
      else
      end

    current_user.experience_point = @totalExp
    current_user.update(experience_point: @totalExp)


    @level_set = LevelSet.find_by(level: current_user.level + 1)

    if @level_set.thresold <= current_user.experience_point
      current_user.level = current_user.level + 1
      current_user.update(level: current_user.level)
    end

    if current_user.level == 2
      current_user.update(job_status: "level2")
    elsif current_user.level == 3
      current_user.update(job_status: "level3")
    elsif current_user.level == 4
      current_user.update(job_status: "level4")
    elsif current_user.level == 5
      current_user.update(job_status: "level5")
    elsif current_user.level == 6
      current_user.update(job_status: "level6")
    elsif current_user.level == 7
      current_user.update(job_status: "level7")
    elsif current_user.level == 8
      current_user.update(job_status: "level8")
    elsif current_user.level == 9
      current_user.update(job_status: "level9")
    elsif current_user.level == 10
      current_user.update(job_status: "level10")
    else
    end


    @task.update(completion_at: @now)
    redirect_to :action => "index"
  end

  private
  def task_params
    params.require(:task).permit(:text, :deadline_at, :importance, :completion_at)
  end

end
