require 'rspec'
require './lib/ride'
require './lib/biker'
require './lib/bike_club'

RSpec.describe BikeClub do
  it "exists" do
    club = BikeClub.new("The Squad")
    expect(club).to be_an_instance_of(BikeClub)
  end

  it "has attributes" do
    club = BikeClub.new("The Squad")
    expect(club.name).to eq("The Squad")
    expect(club.bikers).to eq([])
  end
end