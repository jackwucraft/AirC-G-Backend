class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :open_id
      t.string :avartar_url
      t.string :nickname
      t.string :address

      t.timestamps
    end
  end
end
