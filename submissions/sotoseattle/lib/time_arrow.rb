class TimeArrow
  def initialize(board)
    @board = board
  end

  def tick
    will_die   = @board.unsustainable_locations
    will_spawn = @board.germinal_locations
    tock(will_die, will_spawn)
  end

  private

  def tock(will_die, will_spawn)
    will_die.each   { |location| @board.kill_cell_at(location) }
    will_spawn.each { |location| @board.create_cell_at(location) }
  end
end

