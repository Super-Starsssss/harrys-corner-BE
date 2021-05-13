class CreateClassUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :class_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :class_room, null: false, foreign_key: true
      t.boolean :delete_class_user
      t.timestamps
    end
  end
end
