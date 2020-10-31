class CargoCarriage < Carriage
  attr_reader :type

  def initialize
    @type = 'грузовой'
  end
end
