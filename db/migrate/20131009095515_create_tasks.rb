class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :project_id
      t.string :task

      t.timestamps
    end
    add_index :tasks, :project_id
  end
end
