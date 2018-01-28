

class Car
  attr_reader :color,
               :size,
               :gas_type

  attr_writer :color,
              :size,
              :gas_type



  def initialize(color, size)
    @color = "red"
    @size = 12
    @gas_type = "unleaded"

  end

  def add_wheels(wheels)
    @gas_type <<


end
car_1 = Car.new("red", 4)
car_2 = Car.new("green", 8)
car_3 = Car.new("blue", 10)


car_1.gas.add_food
puts car_1.gas
