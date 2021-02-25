class Car
  attr_reader :make,
              :model,
              :color,
              :year,
              :age
  def initialize(car)
    @car = car
    @make = car[:description].split[1]
    @model = car[:description].split[2]
    @color = car[:description].split[0]
    @year = car[:year]
    @age = 2021 - car[:year].to_i
  end
end
