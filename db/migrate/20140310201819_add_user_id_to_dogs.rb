class AddUserIdToDogs < ActiveRecord::Migration
  def change
  	change_table :dogs do |t|
  		t.integer :user_id
  end
end
end
