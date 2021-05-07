class ClassRoom < ApplicationRecord
  has_one :teacher
  has_many :student_classes
end
