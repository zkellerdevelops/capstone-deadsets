class CreateFavoritesTable < ActiveRecord::Migration
  def up
    create_table :favorites do |t|
      t.integer :user_id, :null => false
      t.integer :concert_id, :null => false
      t.timestamps
    end
  end

  def down
    drop_table :favorites
  end
end
