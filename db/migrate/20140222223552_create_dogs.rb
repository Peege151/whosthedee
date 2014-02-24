class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :nick
      t.string :primarybreed
      t.string :secondarybreed
      t.string :neighborhood
      t.integer :age
      t.integer :weight
      t.timestamps
    end
  end
end
