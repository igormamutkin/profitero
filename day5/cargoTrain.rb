class CargoTrain < Train
  attr_reader :type

  def initialize(number)
    super
    @type = 'грузовой'
  end

  def add_carriage(carriage)
    @array_carriage << carriage if carriage.type == @type
  end

  def train_info
    super
    puts ", тип - #{@type}"
  end
end
