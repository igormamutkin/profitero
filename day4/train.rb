require_relative 'station'
require_relative 'route'

class Train
  attr_reader :number
  attr_accessor :speed, :current_station, :route, :array_carriage

  def initialize(number)
    @number = number
    @speed = 0
    @array_carriage = []
  end

  def pick_up_speed(value)
    @speed += value
  end

  def slow_down(value)
    if value <= @speed
      @speed -= value
    else
      error(2)
    end
  end

  def get_speed
    puts "Скорость поезда #{number} - #{@speed}"
  end

  def remove_carriage(carriage)
    @array_carriage.delete(carriage)
  end

  def get_array_carriage
    puts "У поезда #{number} #{array_carriage.length} вагона(ов)"
  end

  def add_route(route)
    @route = route
    @current_station = route.all_station[0]
    @current_station.add_train(self)
  end

  def go_next
    if station_num + 1 < @route.all_station.length
      @current_station.send_train(self)
      @current_station = find_station('next')
      @current_station.add_train(self)
    else
      error(0)
    end
  end

  def go_back
    if @current_station != @route.all_station.first
      @current_station.send_train(self)
      @current_station = find_station('back')
      @current_station.add_train(self)
    else
      error(1)
    end
  end

  def near_station_info
    puts "Текущая станция - #{@current_station.name}"
    puts "Предыдущая станция - #{find_station('back').name}" if station_num.positive?
    puts "Следующая станция - #{find_station('next').name}" if station_num + 1 < @route.all_station.length
  end

  def train_info
    print "Поезд номер - #{@number}, скорость - #{@speed}"
  end

  private

  def find_station(param)
    if param == 'next'
      @route.all_station[station_num + 1]
    else
      @route.all_station[station_num - 1]
    end
  end

  def station_num
    @route.all_station.index(current_station)
  end

  def error(index)
    array_errors = ['Поезд на конечной станции', 'Поезд на первой станции', 'скорость не может быть меньше нуля']
    puts array_errors[index]
  end
end
