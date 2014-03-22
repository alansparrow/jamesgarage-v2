class ChangeDetailsOfPictures < ActiveRecord::Migration
  def change
    change_table :pictures do |t|
      t.remove :data, :content_type, :filename
      t.string :src_link
    end
  end
end
