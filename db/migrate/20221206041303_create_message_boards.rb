class CreateMessageBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :message_boards do |t|
      t.references :viewer, foreign_key: { to_table: :users }
      t.time :latest_view
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
