class Student < ApplicationRecord
  has_many :student_classes
  belongs_to :user
end
