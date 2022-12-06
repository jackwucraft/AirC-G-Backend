class RenameBrandAsPlatform < ActiveRecord::Migration[7.0]
  def change
    rename_column :products, :brand, :platform
  end
end
