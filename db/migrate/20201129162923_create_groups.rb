class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :street
      t.string :number
      t.string :zip
      t.string :town
      t.string :country
      t.string :language

      t.timestamps
    end
  end
end
