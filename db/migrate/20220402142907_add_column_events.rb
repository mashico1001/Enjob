class AddColumnEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :user_id, :reference
  end
end
