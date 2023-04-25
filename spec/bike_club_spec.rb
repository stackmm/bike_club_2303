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

  it "can tell which biker has logged the most rides" do
    club = BikeClub.new("The Squad")
    biker1 = Biker.new("Kenny", 30)
    biker2 = Biker.new("Athena", 15)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 5, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    biker1.learn_terrain!(:gravel)
    biker1.learn_terrain!(:hills)
    biker2.learn_terrain!(:gravel)
    biker2.learn_terrain!(:hills)
    club.add_biker(biker1)
    club.add_biker(biker2)

    biker1.log_ride(ride1, 92.5)
    biker1.log_ride(ride1, 91.1)
    biker1.log_ride(ride2, 60.9)
    biker1.log_ride(ride2, 61.6)
    biker2.log_ride(ride1, 97.0)
    biker2.log_ride(ride2, 65.0)
    expect(club.most_rides).to eq(biker1)
    biker2.log_ride(ride1, 55.0)
    biker2.log_ride(ride2, 65.0)
    biker2.log_ride(ride2, 35.0)
    expect(club.most_rides).to eq(biker2)
    biker1.log_ride(ride1, 77.1)
    expect(club.most_rides).to eq(biker1)
  end

  it "can tell which biker has the best time for a given Ride" do
    club = BikeClub.new("The Squad")
    biker1 = Biker.new("Kenny", 30)
    biker2 = Biker.new("Athena", 15)
    ride1 = Ride.new({name: "Walnut Creek Trail", distance: 5, loop: false, terrain: :hills})
    ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
    ride3 = Ride.new({name: "Covent Garden", distance: 7.9, loop: true, terrain: :gravel})
    biker1.learn_terrain!(:gravel)
    biker1.learn_terrain!(:hills)
    biker2.learn_terrain!(:gravel)
    biker2.learn_terrain!(:hills)
    club.add_biker(biker1)
    club.add_biker(biker2)

    biker1.log_ride(ride1, 77.5)
    biker2.log_ride(ride1, 91.1)
    expect(club.best_time(ride1)).to eq(biker1)

    biker1.log_ride(ride2, 91.1)
    expect(club.best_time(ride2)).to eq(biker1)
    biker2.log_ride(ride2, 90.1)
    expect(club.best_time(ride2)).to eq(biker2)
    biker1.log_ride(ride2, 89.1)
    expect(club.best_time(ride2)).to eq(biker1)

    biker2.log_ride(ride3, 45)
    expect(club.best_time(ride3)).to eq(biker2)
  end
end