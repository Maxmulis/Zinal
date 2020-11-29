class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :firstname
      t.string :phone
      t.string :comment
      t.date :birthdate
      t.references :camp, null: false, foreign_key: true
      t.references :room, null: true, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
