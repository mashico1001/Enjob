namespace :task do
  desc "通知を送る"
  task :create_notification => :environment do
    
      # @tasks = Task.where(completion_at:nil).where("deadline_at == ?", Time.now + 10.minutes)
      # @tasks_expired = Task.where(completion_at:nil).where("deadline_at <= ?", Time.now)
      
      @tasks = Task.where(completion_at:nil)
      
      
      @tasks.each do |task|
        user = task.user
        if task.deadline_at == Time.now + 10.minutes
          Notification.create(
            user_id: user.id,
            task_id: task.id,
            kind: "warning",
            )
        elsif task.deadline_at <= Time.now
          Notification.create(
            user_id: user.id,
            task_id: task.id,
            kind: "expired"
            )
        else
        end
     end
  end
end