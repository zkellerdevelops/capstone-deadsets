class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :media_link
      t.string :info

      t.timestamps
    end
  end
end
