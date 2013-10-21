class AddStateAndCityToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :state, :string, null: false
    add_column :lessons, :city, :string, null: false
  end
end
