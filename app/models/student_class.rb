class StudentClass < ApplicationRecord
  belongs_to :student
  belongs_to :class_room

  scope :search_id, ->(id) { where(class_room: id) }
end
