class PassengerCarriage < Carriage
  attr_reader :type

  def initialize
    @type = 'пассажирский'
  end
end
