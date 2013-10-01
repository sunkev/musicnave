class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, null: false
      t.integer :lesson_id, null: false
      t.text :body, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at

      t.timestamp
    end
  end
end
