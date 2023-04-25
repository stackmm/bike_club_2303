class Biker
  attr_reader :name, :max_distance, :rides, :acceptable_terrain

  def initialize(name, max_distance)
    @name = name
    @max_distance = max_distance
    @rides = {} # can log a previous ride with an associated time
    @acceptable_terrain = [] # a list of acceptable terrain for that biker
  end

  def learn_terrain!(terrain)
    @acceptable_terrain << terrain
  end
end