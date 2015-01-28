Location = Struct.new(:x, :y) do
  def adjacents
    perimeter_coordinates.map { |coords| Location.new(*coords) }
  end

  protected

  def perimeter_coordinates
    [x + 1, x, x - 1].product([y - 1, y, y + 1]) - [[x, y]]
  end

  def hash
    to_a.hash
  end
end
