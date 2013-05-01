class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :name
      t.boolean :completed
      t.boolean :deleted
      t.datetime :due_at

      t.timestamps
    end
  end
end
