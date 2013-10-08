class CreateStudent < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :lesson_id, null: false
      t.integer :user_id, null: false
    end
  end
end
