class CreateBurroughs < ActiveRecord::Migration
  def change
    create_table :burroughs do |t|
      t.string :name
      t.references :city, index: true

      t.timestamps
    end
  end
end
