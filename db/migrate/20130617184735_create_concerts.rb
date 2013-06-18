class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :date
      t.text :details

      t.timestamps
    end
  end
end
