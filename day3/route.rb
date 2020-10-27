require_relative 'station.rb'

class Route

  attr_reader :all_station

  def initialize(first_station, last_station)
  	@all_station = [first_station, last_station]
  end

  def add_station(station)
  	@all_station.insert(@all_station.length - 1, station)
  end
 
  def remove_station(station)
    @all_station.delete(station)
  end

  def list_station
  	 @all_station.each {|station| station.station_info}
  end

end
