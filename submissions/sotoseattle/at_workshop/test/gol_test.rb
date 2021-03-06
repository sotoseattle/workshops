require 'minitest/autorun'
require_relative '../lib/gol.rb'

# A new game has no cells
# A new game after a tick ... nothing changes
# A new game, when I add a new live cell, after a tick the single cell dies alone
# A game with 3 cells distant from each other (0,0 : 0,10 : 20,20), after a tick, they all die!!
# A game with 3 cells in a row (0,1 : 0,2 : 0,3), rotates as the clock ticks, and 3 cells always remain!
# A game with 3 initial cells in L formation (0,0 : 0,1 : 1,0), after a tick of the clock, we have a estable block
# A game with a block of 4 cells (0,0 : 0,1 : 1,0 : 1,1), stays stable and does not change as the clock ticks.

ROW    = [[0,0], [1,0], [2,0]]
HAT    = [[0,0], [1,0], [2,0], [1,1]]
BLOCK9 = [[0,0], [0,1], [0,2],
          [1,0], [1,1], [1,2],
          [2,0], [2,1], [2,2]]


class EmptyGame < Minitest::Test
  def setup
    @game = GoL.new
  end

  def test_a_new_game_everybody_dead
    assert_equal 0, @game.alive.size
  end

  def test_new_game_with_no_cells_nothing_changes
    assert_equal 0, @game.tick.alive.size
  end
end

class LivingCellsRule < Minitest::Test
  def setup
    @game = GoL.new
  end

  def test_single_cell_game_dies_alone
    assert_equal 0, @game.add([[10,20]]).tick.alive.size
  end

  def test_cells_with_2_or_3_neighbors_survives
    assert @game.add(HAT).tick.alive.superset? HAT.to_set
  end

  def test_cell_with_more_than_3_neighbors_dies
    refute_includes @game.add(BLOCK9).tick.alive, [1,1]
  end

  def test_3_cells_in_a_row_only_middle_one_survives
    @game.add(ROW).tick
    assert_includes @game.alive, [1, 0]
    refute_includes @game.alive, [0, 0]
    refute_includes @game.alive, [2, 0]
  end
end

class GerminatingCellsRule < Minitest::Test
  def setup
    @game = GoL.new
  end

  def test_a_dead_cell_next_to_1_live_cell_stays_dead
    refute_includes @game.add(ROW).tick.alive, [-1,0]
  end

  def test_a_dead_cell_next_to_2_live_cell_stays_dead
    refute_includes @game.add(ROW).tick.alive, [0,1]
  end

  def test_a_dead_cell_next_to_3_live_cell_comes_alive
    assert_includes @game.add(ROW).tick.alive, [1,1]
  end

  def test_a_dead_cell_next_to_more_than_3_live_cell_stays_dead
    donut = BLOCK9 - [1,1]
    refute_includes @game.add(donut).tick.alive, [1,1]
  end
end

