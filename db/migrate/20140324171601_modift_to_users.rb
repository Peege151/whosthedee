class ModiftToUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :Burrough, :burrough_id
  	rename_column :users, :hood, :hood_id
  	rename_column :users, :city, :city_id

  end
end
