class ClassRoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :teacher_id, :name_teacher, :delete_class, :students

  def name_teacher
    teach = Teacher.find_by id: object.teacher_id
    teach.user.name
  end

  def students
    StudentClass.show_student.members object.id
  end
end
