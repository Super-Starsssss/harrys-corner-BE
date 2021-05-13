class CreateClassRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :class_rooms do |t|
      t.string :name
      t.boolean :delete_class_room

      t.timestamps
    end
  end
end
