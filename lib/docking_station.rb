require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity, :bikes, :broken_bikes, :bike

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
    @broken_bikes = []
  end

  def release_bike
    fail "No bikes available" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail "No space available, try a different docking station" if full?
      bike.broken? ? broken_bikes << bike : bikes << bike
  end

  private

  def full?
    (bikes.count + broken_bikes.count) == capacity
  end

  def empty?
    bikes.empty?
  end

end
