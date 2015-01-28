require 'set'

class World < Set
  alias_method :number_of_living_cells, :size

  def unsustainable_locations
    select { |loc| !survives?(loc) }
  end

  def germinal_locations
    potential_perimeter.select { |loc| fertile?(loc) }
  end

  private

  def potential_perimeter
    possible_locations = Set.new
    each { |loc| possible_locations |= loc.adjacents }
    possible_locations.subtract self
  end

  def fertile?(location)
    alive_nearby(location) == 3
  end

  def survives?(location)
    alive_nearby(location).between?(2, 3)
  end

  def alive_nearby(location)
    location.adjacents.count { |loc| include?(loc) }
  end
end
