class Teacher < ApplicationRecord
  has_many :class_rooms
  belongs_to :user
  Teacher.joins(:user)
end
