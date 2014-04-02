class JavascriptsController < ApplicationController
	def dynamic_city
		@cities = City.find(:all)
	end
end
