class CreateExchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :exchanges do |t|
      t.date :time_from
      t.date :time_to
      t.string :game_wanted
      t.references :game_provided, foreign_key: { to_table: :products }
      t.references :game_received, foreign_key: { to_table: :products }
      # belongs_to :game_provided, class_name: "movie"

      t.timestamps
    end
  end
end
