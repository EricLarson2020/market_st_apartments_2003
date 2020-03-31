require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < Minitest::Test



  def test_it_exists
    building = Building.new
    assert_instance_of Building, building
  end


  def test_building_start_with_no_units_and_I_can_add_units
    building = Building.new
    assert_equal [], building.units
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building.add_unit(unit1)
    building.add_unit(unit2)
    assert_equal [unit1, unit2], building.units
  end

  def test_the_buildings_units_can_get_renters
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building.add_unit(unit1)
    building.add_unit(unit2)
    assert_equal [], building.renters
    renter1 = Renter.new("Aurora")
    unit1.add_renter(renter1)
    assert_equal ["Aurora"], building.renters
    renter2 = Renter.new("Tim")
    unit2.add_renter(renter2)
    assert_equal ["Aurora", "Tim"], building.renters

  end

  def test_building_average_rent
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building.add_unit(unit1)
    building.add_unit(unit2)
    assert_equal 1099.5, building.average_rent
  end

  def test_rented_units
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})
    unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
    renter1 = Renter.new("Spencer")
    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)
    assert_equal [], building.rented_units
    unit2.add_renter(renter1)
    assert_equal [unit2], building.rented_units
  end

  def test_renter_with_highest_rent
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})
    unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
    renter1 = Renter.new("Spencer")
    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)
    assert_equal [], building.rented_units
    unit2.add_renter(renter1)
    assert_equal renter1, building.renter_with_highest_rent
    renter2 = Renter.new("Jessie")
    unit1.add_renter(renter2)
    assert_equal renter2, building.renter_with_highest_rent
    renter3 = Renter.new("Max")
    unit3.add_renter(renter3)
    assert_equal renter2, building.renter_with_highest_rent
  end

  def test_building_units_by_number_of_bedrooms
    building = Building.new
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})
    unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
    renter1 = Renter.new("Spencer")
    building.add_unit(unit1)
    building.add_unit(unit2)
    building.add_unit(unit3)
    building.add_unit(unit4)

    unit_bedrooms = {
      3 => ["D4" ],
      2 => ["B2", "C3"],
      1 => ["A1"]
                    }
    assert_equal unit_bedrooms, building.units_by_number_of_bedrooms
  end
end

#   def test_annual_breakdown
#     building = Building.new
#     unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
#     unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
#     unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
#     renter1 = Renter.new("Spencer")
#     building.add_unit(unit1)
#     building.add_unit(unit2)
#     building.add_unit(unit3)
#     unit2.add_renter(renter1)
#     assert_equal ({"Spencer" => 11988}), building.annual_breakdown
#   end
# end


# ```ruby
# pry(main)> require './lib/building'
# # => true
#
# pry(main)> require './lib/apartment'
# # => true
#
# pry(main)> require './lib/renter'
# # => true
#
# pry(main)> building = Building.new
# # => #<Building:0x00007fb333c0cec8...>
#
# pry(main)> unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
# # => #<Apartment:0x00007fb333bcd840...>
#
# pry(main)> unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
# # => #<Apartment:0x00007fb333a55008...>
#
# pry(main)> unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
# # => #<Apartment:0x00007fa83bc777d0...>
#
# pry(main)> renter1 = Renter.new("Spencer")
# # => #<Renter:0x00007fb333d0d7f0...>
#
# pry(main)> building.add_unit(unit1)
#
# pry(main)> building.add_unit(unit2)
#
# pry(main)> building.add_unit(unit3)
#
# pry(main)> unit2.add_renter(renter1)
#
# pry(main)> building.annual_breakdown
# # => {"Spencer" => 11988}
#
# pry(main)> renter2 = Renter.new("Jessie")
# # => #<Renter:0x00007fb333af5a80...>
#
# pry(main)> unit1.add_renter(renter2)
#
# pry(main)> building.annual_breakdown
# # => {"Jessie" => 14400, "Spencer" => 11988}
#
# pry(main)> building.rooms_by_renter
# #=> {<Renter:0x00007fb333af5a80...> => {bathrooms: 1, bedrooms: 1},
# #    #<Renter:0x00007fb333d0d7f0...> => {bathrooms: 2, bedrooms: 2}}
#
# ```
