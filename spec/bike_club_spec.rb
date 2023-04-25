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

  it "can add bikers to the club" do
    club = BikeClub.new("The Squad")
    biker1 = Biker.new("Kenny", 30)
    biker2 = Biker.new("Athena", 15)

    expect(club.bikers).to eq([])
    club.add_biker(biker1)
    expect(club.bikers).to eq([biker1])
    club.add_biker(biker2)
    expect(club.bikers).to eq([biker1, biker2])
  end
end