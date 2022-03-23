class AddJobStatusToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :job_status, :integer, default: 0
  end
end
