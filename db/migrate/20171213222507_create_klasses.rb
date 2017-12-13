class CreateKlasses < ActiveRecord::Migration[5.0]
  def change
    create_table :klasses do |t|
      t.string :name
      t.string :teacher
      t.string :day
      t.integer :start
      t.integer :duration
    end
  end
end
