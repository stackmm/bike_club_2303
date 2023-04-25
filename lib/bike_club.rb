class BikeClub
  attr_reader :name, :bikers

  def initialize(name)
    @name = name
    @bikers = []
  end

  def add_biker(biker)
    @bikers << biker
    @bikers # the method asked for a return value of an Array of Biker Objects
  end

  def most_rides
    @bikers.max_by do |biker|
      biker.rides.values.flatten.length
    end
  end

  def best_time(ride)
    @bikers.min_by do |biker|
      if biker.rides.keys.include?(ride)
        biker.personal_record(ride)
      else  
        # if a biker's @rides does NOT contain that specific Ride, 
        # use inifinity for the comparison so the biker with a time logged will always be less
        Float::INFINITY
      end
    end
  end

  def bikers_eligible(ride)
    @bikers.select do |biker|
      biker.acceptable_terrain.include?(ride.terrain) &&
      ride.total_distance <= biker.max_distance
    end
  end

end