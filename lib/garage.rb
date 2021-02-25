class Garage
  attr_reader :name, :customers
  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(owner)
    @customers << owner
  end

  def all_cars
    all_cars = []
    @customers.each do |customer|
      all_cars << customer.cars
    end
    all_cars.flatten!
  end

  def cars_by_make
    car_hash = Hash[:description, :year]
    car_hash[:description] = @customers.map do |customer|
        customer.cars[0].split[1..3] * " "
      end
      car_hash[:year] = @customers.map do |customer|
        customer.cars[0].split[0]
      end
    require 'pry'; binding.pry
  end
end
