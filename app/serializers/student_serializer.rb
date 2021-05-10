class StudentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :delete_student, :name
  belongs_to :user

  def name
    "hello"
  end
end
