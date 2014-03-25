class RemoveReferenceFromHood < ActiveRecord::Migration
  def change
  	rename_column :hoods, :city_id, :burrough_id
  end
end
