class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title, null: false
      t.text :description
      t.integer :teacher_id, null: false
      t.timestamps
    end
  end
end
