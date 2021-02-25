class Owner
  attr_reader :name, :occupation, :cars
  def initialize(name, occupation)
    @name = name
    @occupation = occupation
    @cars = []
  end

  def buy(car)
    @cars << car
  end 
end
