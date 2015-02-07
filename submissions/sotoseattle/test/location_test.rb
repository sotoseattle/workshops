require 'minitest/autorun'
require_relative '../lib/location.rb'

class NewLocation < Minitest::Test
  def setup
    @loc = Location.new(3, 0)
  end

  def test_location_keeps_oordinates
    assert_equal 3, @loc.x
  end

  def test_location_keeps_cordinates
    assert_equal 0, @loc.y
  end

  def test_location_has_adjacents
    assert_equal 8, Location.new(rand, rand).adjacents.size
  end

  def test_equality
    assert_equal Location.new(3, 0), @loc
    refute_equal Location.new(0, 0), @loc
  end
end

