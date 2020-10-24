require_relative 'train.rb'

class Station

  def initialize(name)
	@name = name
	@trains = []
  end

  attr_accessor :name

  def add_train(train)
  	@trains << train
  end

  def get_trains
  	puts @trains.to_s
  end

  def get_trains_for_type(type)
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
    puts result.to_s
  end

  def send_train(train)
    @trains.delete(train)
  end

end