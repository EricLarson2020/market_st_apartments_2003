require 'rspec/autorun'
require './lib/renter'
require './lib/apartment'

RSpec.describe Renter do

  it "Exists" do
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    expect(unit1).to be_an_instance_of(Apartment)
  end

  describe "#attributes" do
    it "Has Attributes" do
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    expect(unit1.number).to eql("A1")
    expect(unit1.monthly_rent).to eql(1200)
    expect(unit1.bathrooms).to eql(1)
    expect(unit1.bedrooms).to eql(1)
  end
end

  it "Can get a renter" do
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    renter1 = Renter.new("Jessie")
    expect(unit1.renter).to be_nil
    unit1.add_renter(renter1)
    expect(unit1.renter).to eql(renter1)
  end

end
