class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.date :date
      t.text :venue
      t.text :tour

      t.timestamps
    end
  end
end
