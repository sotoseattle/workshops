require 'Set'

class GoL
  attr_accessor :alive

  def initialize
    @alive = Set.new
  end

  def tick
    survive = @alive.keep_if do |cell|
      neighbors_alive(cell).between?(2, 3)
    end

    @alive = survive
    self
  end

  def add(cells)
    cells.each { |c| @alive << c }
    self
  end

  def neighbors_alive(cell)
    neighbors(cell).count { |n| @alive.include?(n) }
  end

  def neighbors(cell)
    x, y = cell
    [x-1, x, x+1].product([y-1, y, y+1]) - [[x, y]]
  end
end
