class AddLessonPhotoToLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :lesson_photo, :string
  end
end
