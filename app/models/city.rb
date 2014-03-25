class City < ActiveRecord::Base
has_many :hoods
has_many :burroughs
end
