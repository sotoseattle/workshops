require_relative './location'

class Chart
  def initialize(world = nil)
    bunch_of_locations = world ? world.to_a : []
    @locations = Array.new(bunch_of_locations)
    @bottom_left, @top_right = frame

    if @locations.empty?
      @width  = @heigth = 0
    else
      @width  = @top_right.x - @bottom_left.x + 1
      @heigth = @top_right.y - @bottom_left.y + 1
    end
  end

  def to_2d
    return '' if @locations.empty?
    arr = ['.'] * @width * @heigth
    @locations.each { |loc| arr[loc.x * @width + loc.y] = 'X' }
    arr.each_slice(@width).map { |sub| sub << "\n" }.join
  end

  private

  def frame
    return [nil, nil] if @locations.empty?

    bottom_left_corner = Location.new(Float::INFINITY, Float::INFINITY)
    top_right_corner   = Location.new(-Float::INFINITY, -Float::INFINITY)

    @locations.each do |loc|
      bottom_left_corner.x = loc.x if loc.x < bottom_left_corner.x
      bottom_left_corner.y = loc.y if loc.y < bottom_left_corner.y
      top_right_corner.x   = loc.x if loc.x > top_right_corner.x
      top_right_corner.y   = loc.y if loc.y > top_right_corner.y
    end

    [bottom_left_corner, top_right_corner]
  end
end

