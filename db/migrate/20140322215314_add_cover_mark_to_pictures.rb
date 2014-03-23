class AddCoverMarkToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :cover_mark, :boolean
  end
end
