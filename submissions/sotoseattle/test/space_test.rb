require 'minitest/autorun'
require_relative '../lib/space.rb'

class EmptySpace < MiniTest::Test
  def setup
    @empty_grid = Space.new
  end

  def test_new_grid_has_no_cells
    assert 0, @empty_grid.number_of_living_cells
  end

  def test_has_no_germinal_locations
    assert_equal 0, @empty_grid.germinal_locations.size
  end
end

class GrowingSpace < MiniTest::Test
  def setup
    @empty_grid = Space.new
  end

  def test_add_first_cell
    @empty_grid.add(Location.new(0, 0))
    assert_equal 1, @empty_grid.number_of_living_cells
  end

  def test_add_multiple_cells
    7.times { @empty_grid.add(Location.new(rand, rand)) }
    assert_equal 7, @empty_grid.number_of_living_cells
  end
end

class FlourishingSpace < MiniTest::Test
  def setup
    @empty_grid = Space.new
  end

  def test_potential_for_life_I
    @empty_grid.add(Location.new(0, 0)).add(Location.new(0, 1))
    assert_equal 0, @empty_grid.germinal_locations.size
  end

  def test_potential_for_life_II
    @empty_grid.add(Location.new(0, 0)).add(Location.new(0, 1)).add(Location.new(1, 0))
    assert_equal 1, @empty_grid.germinal_locations.size
    assert_equal [1, 1], @empty_grid.germinal_locations.first.to_a
  end

  def test_potential_for_life_III
    @empty_grid.add(Location.new(0, 0)).add(Location.new(0, 1)).add(Location.new(0, -1))
    @empty_grid.add(Location.new(1, 0)).add(Location.new(-1, 0))
    assert_equal 4, @empty_grid.germinal_locations.size
  end
end

