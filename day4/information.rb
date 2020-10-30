require_relative 'station'
require_relative 'passengerTrain'
require_relative 'cargoTrain'

class Information
  attr_accessor :array_stations,
                :array_cargoTrains,
                :array_passengerTrains,
                :array_routs,
                :array_passengerCarriags,
                :array_cargoCarriags

  def initialize
    @array_stations = []
    @array_cargoTrains = []
    @array_passengerTrains = []
    @array_routs = []
    @array_passengerCarriags = []
    @array_cargoCarriags = []
  end

  def show_stations
    @array_stations.each { |station| puts "Станция - #{station.name}" }
  end

  def show_stations_with_index
    @array_stations.each_with_index { |station, index| puts "#{index + 1} - #{station.name}" }
  end

  def show_cargoTrains
    @array_cargoTrains.each { |train| puts "Поезд - #{train.number}" }
  end

  def show_cargoTrains_with_index
    @array_cargoTrains.each_with_index { |train, index| puts "#{index + 1} - #{train.number}" }
  end

  def show_passengerTrains
    @array_passengerTrains.each { |train| puts "Поезд - #{train.number}" }
  end

  def show_passengerTrains_with_index
    @array_passengerTrains.each_with_index { |train, index| puts "#{index + 1} - #{train.number}" }
  end

  def show_routs
    @array_routs.each { |route| "#{route.name} - #{route.list_station}" }
  end

  def show_routs_with_index
    @array_routs.each_with_index { |route, index| puts "#{index + 1} - #{route.name}" }
  end

  def stations_of_routs(route)
    route.all_station.each { |flag| puts "#{route.all_station.index(flag) + 1} - #{flag.name}" }
  end
end
