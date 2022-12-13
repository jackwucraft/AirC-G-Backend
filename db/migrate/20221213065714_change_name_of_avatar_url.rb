class ChangeNameOfAvatarUrl < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :avartar_url, :avatar_url
  end
end
