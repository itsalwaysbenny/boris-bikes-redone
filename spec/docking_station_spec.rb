require 'docking_station'
require 'bike'

describe DockingStation do

  it "responds to release_bike" do
    expect(DockingStation.new).to respond_to :release_bike
  end

  describe "initialization" do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it "defaults capacity" do
      ds = DockingStation.new
      20.times { ds.dock(:bike) }
      expect{ ds.dock(:bike) }.to raise_error "No space available, try a different docking station"
    end
  end

  describe "#release_bike" do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it "releases a bike" do
      subject.dock(:bike)
      expect(subject.release_bike).to eq :bike
    end
  end

  describe "#release_bike" do
    it "raises an error when there are no bikes available" do
      subject { DockingStation.new }
      expect { subject.release_bike}.to raise_error "No bikes available"
    end
  end

  it "responds to dock" do
    expect(DockingStation.new).to respond_to(:dock).with(1).argument
  end

  describe "#dock" do
    it "rasies an error when docking station is full" do
      subject { DockingStation.new }
      described_class::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error "No space available, try a different docking station"
    end
  end

  it "has a default capacity" do
    expect(DockingStation.new.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe "initialization" do
    it "has a variable capacity" do
      docking_station = DockingStation.new
      described_class::DEFAULT_CAPACITY.times { docking_station.dock Bike.new }
      expect{ docking_station.dock Bike.new }.to raise_error "No space available, try a different docking station"
    end
  end

end
