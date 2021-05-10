class CreateClassRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :class_rooms do |t|
      t.string :name
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
