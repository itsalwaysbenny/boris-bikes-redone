require 'docking_station'
require 'bike'

describe DockingStation do

  it "responds to release_bike" do
    expect(DockingStation.new(10)).to respond_to :release_bike
  end

  describe "initialization" do
    subject { DockingStation.new(20) }
    let(:bike) { Bike.new }
    it "defaults capacity" do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error "No space available, try a different docking station"
    end
  end

  describe "#release_bike" do
    it "releseases a bike" do
      bike = Bike.new
      ds = DockingStation.new(20)
      ds.dock(bike)
      expect(ds.release_bike).to eq bike
    end
  end

  describe "#release_bike" do
    it "raises an error when there are no bikes available" do
      ds = DockingStation.new(0)
      expect { ds.release_bike}.to raise_error "No bikes available"
    end
  end

  it "responds to dock" do
    expect(DockingStation.new(10)).to respond_to(:dock).with(1).argument
  end

  describe "#dock" do
    it "rasies an error when docking station is full" do
      ds = DockingStation.new(20)
      ds.capacity.times { ds.dock Bike.new }
      expect { ds.dock Bike.new }.to raise_error "No space available, try a different docking station"
    end
  end

  it "has a default capacity" do
    expect(DockingStation.new(20).capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe "initialization" do
    it "has a variable capacity" do
      docking_station = DockingStation.new(10)
      10.times { docking_station.dock Bike.new }
      expect{ docking_station.dock Bike.new }.to raise_error "No space available, try a different docking station"
    end
  end

end
