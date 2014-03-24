class Burrough < ActiveRecord::Base
  belongs_to :city
  has_many :hoods
end
