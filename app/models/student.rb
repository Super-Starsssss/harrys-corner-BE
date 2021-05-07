class Student < ApplicationRecord
  has_one :users
  has_many :student_classes
end
