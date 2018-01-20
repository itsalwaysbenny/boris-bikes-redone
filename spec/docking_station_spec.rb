require 'docking_station'
require 'bike'

describe DockingStation do

  it "responds to release_bike" do
    expect(subject).to respond_to :release_bike
  end

  describe "#release_bike" do
    it "releseases a bike" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  describe "#release_bike" do
    it "raises an error when there are no bikes available" do
      expect { subject.release_bike}.to raise_error "No bikes available"
    end
  end

  it "responds to dock" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it "responds to bike" do
    expect(subject).to respond_to :bike
  end

  describe "#dock" do
    it "rasies an error when docking station is full" do
      20.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error "No space available, try a different docking station"
    end
  end

end
