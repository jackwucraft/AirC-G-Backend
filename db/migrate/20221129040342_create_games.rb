class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.integer :price_per_day
      t.string :brand
      t.string :picture_url

      t.timestamps
    end
  end
end
