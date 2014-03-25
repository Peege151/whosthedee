class AddBurroughToUser < ActiveRecord::Migration
  def change
    add_column :users, :Burrough, :string
    rename_column :users, :neighborhood, :hood

  end
end
