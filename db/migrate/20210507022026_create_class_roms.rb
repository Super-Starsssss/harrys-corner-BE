class CreateClassRoms < ActiveRecord::Migration[6.1]
  def change
    create_table :class_rooms do |t|
      t.string :name, null: false
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
