class StudentClass < ApplicationRecord
  belongs_to :student
  belongs_to :class_room

  scope :members, ->(id) { where("class_room_id = ? ", id) }
  scope :show_student, -> {
          joins(student: [:user])
            .select(:id, :student_id, "users.name", "users.email", "users.birthday")
            .where(delete_student: false)
        }
end
