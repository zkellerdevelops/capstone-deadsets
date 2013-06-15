class CreateSetlists < ActiveRecord::Migration
  def change
    create_table :setlists do |t|
      t.text :showdate
      t.text :deadset

      t.timestamps
    end
  end
end
