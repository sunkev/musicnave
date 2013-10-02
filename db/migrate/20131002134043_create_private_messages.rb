class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false
      t.text :body, null: false

      t.timestamp
    end
  end
end
