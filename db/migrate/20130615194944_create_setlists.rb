class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.integer :concert_id
      t.integer :song_id
      t.integer :order
      t.string :group

      t.timestamps
    end
  end
end
