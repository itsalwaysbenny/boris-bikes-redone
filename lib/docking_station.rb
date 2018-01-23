require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes available" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "No space available, try a different docking station" if full?
    @bikes << bike
  end

  private

  attr_reader :bike

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

end
