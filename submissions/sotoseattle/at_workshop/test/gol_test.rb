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



class Something < Minitest::Test
  def setup
  end

  def test_blablabla
  end
end
