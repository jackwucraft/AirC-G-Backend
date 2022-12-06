class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price_per_day
      t.string :brand
      t.string :picture_url
      t.string :type
      t.string :deal
      t.boolean :available


      t.timestamps
    end
  end
end
