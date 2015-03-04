class GoL
  attr_accessor :alive

  def initialize
    @alive = []
  end

  def tick
    self
  end

  def add(cell)
    @alive.push cell
    self
  end
end
