class StudentClassSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name
  belongs_to :student
  belongs_to :class_room
end
