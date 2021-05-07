class CreateStudentClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :student_classes do |t|
      t.references :student, null: false, foreign_key: true
      t.references :class_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
