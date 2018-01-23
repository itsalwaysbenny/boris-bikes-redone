require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes available" if empty?
    @capacity +=1
    @bikes.pop
  end

  def dock(bike)
    fail "No space available, try a different docking station" if full?
    @bikes << bike
    @capacity -= 1
  end

  private

  attr_reader :bike

  def full?
    @capacity <= 0
  end

  def empty?
    @bikes.empty?
  end

end
