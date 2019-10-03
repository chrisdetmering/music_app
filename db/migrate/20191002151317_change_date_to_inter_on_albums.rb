class ChangeDateToInterOnAlbums < ActiveRecord::Migration[5.2]
  def change
    change_column :albums, :year, :integer
  end
end
