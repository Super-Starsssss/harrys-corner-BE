class ClassRoom < ApplicationRecord
  belongs_to :teacher

  scope :show_class, -> { joins(teacher: [:user]).where(delete_class: false) }
  scope :show_index, -> { joins(teacher: [:user]).select(:id, :name, :teacher_id, "users.name as teacher_name").where(delete_class: false) }
end
