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

  def test_an_empty_game_has_no_living_cells
    assert_equal 0, @game.alive.size
  end

  def test_an_empty_game_after_a_tick_still_is_empty
    assert_equal 0, @game.tick.alive.size
  end
end

class LivingCellsGame < Minitest::Test
  def setup
    @game = GoL.new
  end

  def test_1_living_cell_dies_after_a_tick
    assert 0, @game.add([0,0]).tick.alive.size
  end


end
