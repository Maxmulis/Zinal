class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :number
      t.string :floor
      t.integer :capacity

      t.timestamps
    end
  end
end
