class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :password
  has_one :student, through: :student_class
  has_one :teacher
end
