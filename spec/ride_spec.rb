require 'rspec'
require './lib/ride'

RSpec.describe Ride do
  it "exists" do
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    expect(ride1).to be_an_instance_of(Ride)
  end

  it "has attributes" do
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    expect(ride1.name).to eq("Walnut Creek Trail")
    expect(ride1.distance).to eq(10.7)
    expect(ride1.loop).to eq(false)
    expect(ride1.terrain).to eq(:hills)
  end

  it "can determine total distance" do
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    expect(ride1.total_distance).to eq(21.4)
    expect(ride2.total_distance).to eq(14.9)
  end
end