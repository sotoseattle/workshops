require 'spec_helper'

describe 'Game of Life' do
  let(:empty_game) { GOL.new }

  describe 'A new game' do
    it 'has no cells' do
      empty_game.world.number_of_living_cells.must_equal 0
    end

    it 'after a tick nothing changes' do
      empty_game.tick
      empty_game.world.number_of_living_cells.must_equal 0
    end
  end

  describe 'A game with a single cell' do
    it 'I can add a new live cell to my empty game' do
      game = empty_game
      ret = game.add(new_cell_at(0, 0))
      ret.must_be_kind_of GOL
      game.world.number_of_living_cells.must_equal 1
    end

    it 'after a tick the single cell dies alone' do
      game = empty_game.add(new_cell_at(0, 0))
      game.tick
      game.world.number_of_living_cells.must_equal 0
    end
  end

  describe 'A game with 3 initial cells' do
    it 'in L and next to each other' do
      game = empty_game.add(new_cell_at(0, 0)).add(new_cell_at(0, 1))
             .add(new_cell_at(1, 0))
      game.world.number_of_living_cells.must_equal 3
      game.tick
      game.world.number_of_living_cells.must_equal 4
    end

    it '3 in a row rotates!' do
      game = empty_game.add(new_cell_at(0, 0)).add(new_cell_at(0, 1))
             .add(new_cell_at(0, 2))
      game.world.number_of_living_cells.must_equal 3
      game.tick
      game.world.number_of_living_cells.must_equal 3
      game.tick
      game.world.number_of_living_cells.must_equal 3
    end

    it 'away from each other' do
      game = empty_game.add(new_cell_at(0, 0)).add(new_cell_at(0, 10))
             .add(new_cell_at(0, 200))
      game.world.number_of_living_cells.must_equal 3
      game.tick
      game.world.number_of_living_cells.must_equal 0
    end
  end

  describe 'A game with multiple initial cells' do
    it 'nice and comfy, stays stable' do
      game = empty_game.add(new_cell_at(0, 0)).add(new_cell_at(0, 1))
             .add(new_cell_at(1, 0)).add(new_cell_at(1, 1))
      game.world.number_of_living_cells.must_equal 4
      game.tick
      game.world.number_of_living_cells.must_equal 4
    end
  end

  describe '#visualize' do
    it 'returns the world as a string' do
      game = empty_game.add(new_cell_at(0, 0)).add(new_cell_at(0, 1))
             .add(new_cell_at(1, 0))
      game.visualization.must_equal "XX\nX.\n"
    end
  end
end
