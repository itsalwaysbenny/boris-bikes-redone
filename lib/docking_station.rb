require_relative 'bike'

class DockingStation
  attr_reader :bike

  def release_bike
    fail "No bikes available" unless @bike
    @bike
  end

  def dock(bike)
    fail "No space available, try a different docking station" if @bike
    @bike = bike
  end

end
