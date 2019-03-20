class CreateTaskTagWithTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :task_tag_with_tasks do |t|
      t.references :task_tag, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
