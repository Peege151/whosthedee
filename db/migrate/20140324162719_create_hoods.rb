class CreateHoods < ActiveRecord::Migration
  def change
    create_table :hoods do |t|
      t.string :name
      t.references :city, index: true
      t.timestamps
    end
  end
end
