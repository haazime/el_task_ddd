class CreateDaoTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :dao_tasks, id: :uuid do |t|
      t.text :content, null: false
      t.text :description
      t.integer :status, null: false
      t.integer :priority, null: false
      t.date :deadline
    end
  end
end
