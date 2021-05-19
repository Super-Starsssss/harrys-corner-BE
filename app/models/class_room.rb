class ClassRoom < ApplicationRecord
  has_many :class_users

  scope :show, -> { select(:id, :name).where(delete_class_room: false) }
end
