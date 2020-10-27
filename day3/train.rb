require_relative 'station.rb'
require_relative 'route.rb'

class Train

	attr_reader :number, :type
 	attr_accessor :number_car, :speed, :current_station, :route

	def initialize(number, type, number_car)
		@number = number
		if type.downcase.eql?("грузовой") || type.downcase.eql?("пассажирский")
			@type = type
			else
			puts "Неправильный тип поезда" 
		end
		@number_car = number_car  
 		@speed = 0
	end

  def pick_up_speed(value)
  	@speed+=value
  end

  def slow_down(value)
  	if value <= @speed
  	  @speed -= value 
    else 
      puts "скорость не может быть меньше нуля"
    end
  end

  def get_speed
  	puts "Скорость поезда #{number} - #{@speed}"
  end

  def add_carriage
  	@number_car+=1 if @speed == 0
  end

  def remove_carriage
  	@number_car-=1 if @speed== 0 && @number_car > 1
  end

  def get_carriage
  	puts "Количество вагонов - #{@number_car}"
  end

  def add_route(route)
  	@route = route
    @current_station = route.all_station[0]
    @current_station.add_train(self)
  end	

  def go_next
  	if station_num  + 1 < @route.all_station.length
  	  @current_station.send_train(self)
  	  @current_station = find_station('next')
  	  @current_station.add_train(self)
  	else
  	 puts "Поезд на конечной станции"
  	end 	
  end

  def go_back
  	if @current_station != @route.all_station.first
  		@current_station.send_train(self)
  		@current_station = find_station('back')
  		@current_station.add_train(self)
  	else
  		puts "Поезд на первой станции"
  	end
  end

  def near_station_info
  	puts "Текущая станция - #{@current_station.name}"
  	puts "Предыдущая станция - #{find_station('back').name}" if station_num > 0
  	puts "Следующая станция - #{find_station('next').name}" if station_num  + 1 < @route.all_station.length
  end

  def train_info
  	puts "Поезд номер - #{@number}, тип - #{@type}, количество вагонов - #{@number_car}, скорость - #{@speed}"
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

end