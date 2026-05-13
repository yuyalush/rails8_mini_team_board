class CreateTasks < ActiveRecord::Migration[8.1]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.references :assignee, null: false, foreign_key: { to_table: :users }
      t.string :title
      t.text :description
      t.string :status
      t.string :priority
      t.date :due_on

      t.timestamps
    end
  end
end
