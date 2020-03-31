class Building
  attr_reader :units


  def initialize
    @units = []
    @renters = []

  end


  def add_unit(unit)
    @units << unit
  end

  def renters
    renter_name = []
    units.each do |unit|
      if unit.renter != nil
        renter_name << unit.renter.name
      end
    end
    @renter = renter_name
  end

  def average_rent
    rent = 0
    @units.each do |unit|
      rent += unit.monthly_rent.to_f
    end
    unit_length = @units.length
    avg_rent = (rent.to_f/unit_length.to_f)
    avg_rent
  end

  def renter_with_highest_rent
    highest_rent= rented_units.max_by do |unit|
      unit.monthly_rent
    end
    highest_rent.renter


  end

  def rented_units
    rented_units = []
    units.each do |unit|
      if unit.renter != nil
        rented_units << unit
      end
    end
    rented_units
  end

  def bedroom_units(bedrooms)

    bedroom_number = []

    units.each do |unit|

      if unit.bedrooms == bedrooms
        bedroom_number << unit.number
      end
    end
    bedroom_number
  end

  def units_by_number_of_bedrooms
    {
      3 => bedroom_units(3),
      2 => bedroom_units(2),
      1 => bedroom_units(1)
    }

  end

end
