class GameOfLife
  VERSION = "1.0.0"

  attr_accessor :cells

  def initialize
    self.cells = []
  end

  def update
    cells.replace considered.select { |c| alive? c }.sort
  end

  def considered
    cells.map { |c| neighbors_for(*c) }.flatten(1).uniq
  end

  MIN = { true => 2, false => 3 }

  def alive? cell
    count = (neighbors_for(*cell) & cells).size
    min   = MIN[cells.include? cell]
    count.between? min, 3
  end

  delta  = [-1, 0, 1]
  same   = [0,0]
  DELTAS = (delta.product(delta) - [same])

  def neighbors_for x,y
    DELTAS.map { |(dx,dy)| [x+dx, y+dy] }.reject { |(m,n)| m < 0 || n < 0 }
  end
end
