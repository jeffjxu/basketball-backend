class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.date :date
      t.time :time
      t.text :description
      t.boolean :private
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
