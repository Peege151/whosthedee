class Hood < ActiveRecord::Base
  belongs_to :burrough 
  belongs_to :city
end
