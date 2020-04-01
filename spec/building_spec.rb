require 'rspec/autorun'
require './lib/renter'
require './lib/apartment'
require './lib/building'

RSpec.describe Building do

  it "Exists" do
    building = Building.new
    expect(building).to be_an_instance_of(Building)
  end

  it "Building can add units" do
    building = Building.new
    expect(building.units).to eql([])
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    building.add_unit(unit1)
    building.add_unit(unit2)
    expect(building.units).to eql([unit1, unit2])
  end


  it "Can get renters" do
  building = Building.new
  unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
  unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
  building.add_unit(unit1)
  building.add_unit(unit2)
  expect(building.renters).to eql([])
  renter1 = Renter.new("Aurora")
  unit1.add_renter(renter1)
  expect(building.renters).to eql(["Auora"])
  renter2 = Renter.new("Tim")
  unit2.add_renter(renter2)
  expect(building.renters).to eql(["Auora", "Tim"])
  end





end
