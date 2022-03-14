class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :tasks, :completion_at, true
  end
  
  def down
    change_column_null :tasks, :completion_at, false
  end
end
