require 'rspec/autorun'
require './lib/renter'
RSpec.describe Renter do

  it "Exists" do
      renter1 = Renter.new("Jessie")
      expect(renter1).to be_an_instance_of(Renter)
    end

  describe "#name" do
    it "retruns the name" do
      renter1 = Renter.new("Jessie")
      expect(renter1.name).to eql("Jessie")
    end
  end
end
