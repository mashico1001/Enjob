class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :user_id, null: false
      t.string :text, null: false
      t.integer :importance, null: false, default: 0
      t.datetime :deadline_at, null: false
      t.datetime :completion_at, null: false

      t.timestamps
    end
  end
end
