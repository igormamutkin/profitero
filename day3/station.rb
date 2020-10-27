require_relative 'train.rb'

class Station

  attr_accessor :name

  def initialize(name)
	@name = name
	@trains = []
  end

  def add_train(train)
  	@trains << train
  end

  def show_trains
  	@trains.each {|flag| puts "На станции #{@name} находится поезд - #{flag.number} "}
  	puts "На станции #{name} нет поездов" if @trains.length == 0
  end

  def get_trains_by_type(type)
  	result = []
  	if type.downcase.eql?("грузовой")
  	  @trains.each do |train|
  	    result << train if train.type.downcase.eql?("грузовой")
  	  end
  	else 
  	  @trains.each do |train|
  	    result << train if train.type.downcase.eql?("пассажирский")
  	  end
    end
    result.each {|flag| flag.to_s}
  end

  def send_train(train)
    @trains.delete(train)
  end

  def to_s
  	puts "Станция номер - #{@name}"
  end

end