class AddPrivateToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :private, :boolean, default: false, null: false
  end
end
