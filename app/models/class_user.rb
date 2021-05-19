class ClassUser < ApplicationRecord
  belongs_to :user
  belongs_to :class_room

  scope :show_list_student, ->id { joins(:user).select(:id, :user_id, "users.name", "users.email", "users.birthday", "users.phone_number", "users.address").where("class_room_id = ? and delete_class_user = false", id) }
  scope :show_class_user, -> { joins(:user, :class_room).select(:id, :class_room_id, :user_id, "class_rooms.name as name_class_room", "users.name", "users.email", "users.birthday", "users.phone_number", "users.address").where(delete_class_user: false) }
  scope :searcher, ->(key_word) {
          joins(:user, :class_room)
            .select(:id, :class_room_id, :user_id, "class_rooms.name as name_class_room", "users.name", "users.email", "users.birthday", "users.phone_number", "users.address")
            .where("users.name like ? or 
                    users.email like ? or
                    users.address like ? or
                    users.phone_number like ? or
                    class_rooms.name like ? ", "%#{key_word}%", "%#{key_word}%", "%#{key_word}%", "%#{key_word}%", "%#{key_word}%")
        }
  scope :check_class_user, ->(user_id, class_room_id) { where("user_id = ? and class_room_id = ?", user_id, class_room_id) }

  # scope :search_date, ->(date) {
  #         joins(:user, :class_room).select(:id, :class_room_id, :user_id, "class_rooms.name as name_class_room", "users.name", "users.email", "users.birthday", "users.phone_number", "users.address")
  #           .where("DATEPART(yy, birthday) = ? or DATEPART(dd, birthday) = ? or DATEPART(mm, birthday) = ? or birthday = ?" date , date ,  )
  #       }
end
