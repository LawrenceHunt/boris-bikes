require_relative 'bike'

class DockingStation

	def dock(bike)
	fail 'Docking station full' if @bike
	@bike = bike
	end



	def release_bike
		fail "No bikes available" unless @bike
		@bike
	end

attr_reader :bike

end
