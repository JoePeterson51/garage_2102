require 'minitest/autorun'
require 'minitest/pride'
require './lib/garage'
require './lib/owner'
require './lib/car'
class GarageTest < Minitest::Test

  def test_it_exists
    garage = Garage.new('Totally Safe Parking')

    assert_instance_of Garage, garage
  end

  def test_it_has_attributes
    garage = Garage.new('Totally Safe Parking')

    assert_equal "Totally Safe Parking", garage.name
  end

  def test_it_can_add_customers
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_1.buy('1967 Green Ford Mustang')
    owner_1.buy('2001 Blue Ford Escape')
    owner_2 = Owner.new('Glen Coco', 'Unknown')
    owner_2.buy('1963 Green Chevrolet Corvette')
    owner_2.buy('2020 Silver Volvo XC90')

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)

    assert_equal [owner_1, owner_2], garage.customers
  end

  def test_it_can_show_cars_in_garage
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_1.buy('1967 Green Ford Mustang')
    owner_1.buy('2001 Blue Ford Escape')
    owner_2 = Owner.new('Glen Coco', 'Unknown')
    owner_2.buy('1963 Green Chevrolet Corvette')
    owner_2.buy('2020 Silver Volvo XC90')

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)

    assert_equal ['1967 Green Ford Mustang',
                  '2001 Blue Ford Escape',
                  '1963 Green Chevrolet Corvette',
                  '2020 Silver Volvo XC90'
                ], garage.all_cars
  end

  def test_it_can_list_car_makes
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_1.buy('1967 Green Ford Mustang')
    owner_1.buy('2001 Blue Ford Escape')
    owner_2 = Owner.new('Glen Coco', 'Unknown')
    owner_2.buy('1963 Green Chevrolet Corvette')
    owner_2.buy('2020 Silver Volvo XC90')

    garage.add_customer(owner_1)
    garage.add_customer(owner_2)

    assert_equal ({"Ford" => ['1967 Green Ford Mustang', '2001 Blue Ford Escape'],
                   "Chevrolet" => ['1963 Green Chevrolet Corvette'],
                   "Volvo" => ['2020 Silver Volvo XC90'
                 ]}), garage.cars_by_make
  end
end
