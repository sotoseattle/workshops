require_relative './space'
require_relative './time_arrow'
require_relative './chart'

class GOL
  attr_reader :world

  def initialize
    @world = Space.new
    @clock = TimeArrow.new(@world)
  end

  def size
    @world.number_of_living_cells
  end

  def add(location)
    @world.create_cell_at(location)
    self
  end

  def tick
    @clock.tick
  end
end

