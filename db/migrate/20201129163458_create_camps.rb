class CreateCamps < ActiveRecord::Migration[6.0]
  def change
    create_table :camps do |t|
      t.date :startdate
      t.date :enddate

      t.timestamps
    end
  end
end
