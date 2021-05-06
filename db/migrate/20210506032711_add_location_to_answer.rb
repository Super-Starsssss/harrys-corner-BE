class AddLocationToAnswer < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :location, :integer
  end
end
