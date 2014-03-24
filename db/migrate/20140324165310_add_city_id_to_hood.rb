class AddCityIdToHood < ActiveRecord::Migration
  def change
  	add_column :hoods, :city_id, :integer
  end
end
