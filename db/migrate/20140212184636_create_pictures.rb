class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :album_id
      t.string :filename
      t.string :content_type
      t.binary :data

      t.timestamps
    end
  end
end
