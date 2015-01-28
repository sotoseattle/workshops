require_relative './world'
require_relative './chart'

class GOL
  attr_reader :world

  def initialize
    @world = World.new
  end

  def add(another_living_cell_location)
    @world.add(another_living_cell_location)
    self
  end

  def remove(living_cell_location)
    @world.delete(living_cell_location)
  end

  def visualization
    Chart.new(@world).to_2d
  end

  def tick
    will_die   = @world.unsustainable_locations
    will_spawn = @world.germinal_locations
    tock(will_die, will_spawn)
  end

  private

  def tock(dead_cells, born_cells)
    dead_cells.each { |cell| remove(cell) }
    born_cells.each { |cell| add(cell) }
  end
end
