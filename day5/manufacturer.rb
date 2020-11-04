module Manufacturer
  attr_accessor :manufacturer_name

  def show_manufacturer_name
    puts "Имя производителя #{@manufacturer_name}"
  end
end
