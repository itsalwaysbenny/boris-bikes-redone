require 'docking_station'
require 'bike'

describe DockingStation do

  it "responds to release_bike" do
    expect(subject).to respond_to :release_bike
  end

  it "relseases a working bike" do
    bike = subject.release_bike
    expect(bike).to be_working
  end

end
