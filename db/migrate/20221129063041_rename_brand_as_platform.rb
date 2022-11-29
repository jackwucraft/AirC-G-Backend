class RenameBrandAsPlatform < ActiveRecord::Migration[7.0]
  def change
    rename_column :games, :brand, :platform
  end
end
