class AddDeleteStudentToStudentClass < ActiveRecord::Migration[6.1]
  def change
    add_column :student_classes, :delete_student, :boolean
  end
end
