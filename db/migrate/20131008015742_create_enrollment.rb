class CreateEnrollment < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :lesson_id, null: false
      t.integer :user_id, null: false
    end
  end
end
