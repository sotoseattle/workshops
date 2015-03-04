require 'Set'

class GoL
  attr_accessor :alive

  def initialize
    self.alive = Set.new
  end

  def tick
    self.alive = potentials.keep_if { |c| neighbors_alive(c) == 3 } +
                 alive.keep_if { |c| neighbors_alive(c).between?(2, 3) }
    self
  end

  def add(position)
    position.each { |e| @alive << e }
    self
  end

  def neighbors_alive(cell)
    neighbors(cell).count { |c| @alive.include? c }
  end

  def neighbors(cell)
    x, y = cell
    [x-1, x, x+1].product([y-1, y, y+1]) - [[x,y]]
  end

  def potentials
    s = Set.new
    alive.each { |a| neighbors(a).each { |c| s << c unless alive.include?(c) } }
    s
  end
end

