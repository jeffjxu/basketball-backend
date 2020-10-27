class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :favoriter, foreign_key: { to_table: :users }
      t.references :favoritee, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
