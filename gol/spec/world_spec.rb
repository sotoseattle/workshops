require 'spec_helper'

describe 'grid' do
  let(:empty_grid) { World.new }

  describe 'A new grid' do
    it 'has no cells' do
      empty_grid.number_of_living_cells.must_equal 0
    end
  end

  describe '#add' do
    it 'add a location to an empty grid' do
      grid = empty_grid
      grid.add(Location.new(0, 0))
      grid.number_of_living_cells.must_equal 1
    end
  end

  describe '#potential_perimeter' do
    it 'the perimeter expands as we add cells' do
      grid = empty_grid
      grid.send(:potential_perimeter).size.must_equal 0
      grid.add(Location.new(0, 0))
      grid.send(:potential_perimeter).size.must_equal 8
      grid.add(Location.new(0, 1))
      grid.send(:potential_perimeter).size.must_equal 10
      grid.add(Location.new(1, 1))
      grid.send(:potential_perimeter).size.must_equal 12
      grid.add(Location.new(1, 0))
      grid.send(:potential_perimeter).size.must_equal 12
    end
  end

  describe 'germinal_locations' do
    it '' do
      empty_grid.add(Location.new(0, 0))
      empty_grid.germinal_locations.size.must_equal 0
    end

    it '' do
      empty_grid.add(Location.new(0, 0))
      empty_grid.add(Location.new(0, 1))
      empty_grid.germinal_locations.size.must_equal 0
    end

    it '' do
      empty_grid.add(Location.new(0, 0))
      empty_grid.add(Location.new(0, 1))
      empty_grid.add(Location.new(1, 0))
      empty_grid.germinal_locations.size.must_equal 1
      empty_grid.germinal_locations.first.to_a.must_equal [1, 1]
    end

    it '' do
      empty_grid.add(Location.new(0, 0))
      empty_grid.add(Location.new(0, 1))
      empty_grid.add(Location.new(0, -1))
      empty_grid.add(Location.new(1, 0))
      empty_grid.add(Location.new(-1, 0))
      empty_grid.germinal_locations.size.must_equal 4
    end
  end
end
