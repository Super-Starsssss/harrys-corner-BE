class AddDeleteClassToClassRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :class_rooms, :delete_class, :boolean
  end
end
