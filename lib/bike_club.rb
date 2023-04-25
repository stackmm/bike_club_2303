class BikeClub
  attr_reader :name, :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
    @bikers # asked for a return value of an Array of Biker Objects
  end

  def most_rides
    @bikers.max_by do |biker|
      biker.rides.values.flatten.length
    end
  end

end