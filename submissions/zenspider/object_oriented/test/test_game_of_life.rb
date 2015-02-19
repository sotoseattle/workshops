require "minitest/autorun"
require "game_of_life"

class TestGameOfLife < Minitest::Test
  attr_accessor :gol

  def setup
    self.gol = GameOfLife.new
  end

  def test_facts
    # there are cells
    assert_equal [], gol.cells

    gol.cells = []

    # there is some sort of update method
    assert gol.update

    # cells are either alive or dead/non-existent
    # on update, the rules are applied and the next iteration is calculated

    # # neighbors | state
    # <2          | dead
    # >3          | dead
    # 2..3        | stay live
    # 3           | spawn new

    assert_update [], []
    assert_update [], [[1,1]]
    assert_update [], [[1,1],[2,1]]
    assert_update [], [[2,1],[1,1]]

    # http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life#Examples_of_patterns
    # block - stable 3
    assert_update [[1,1],[2,1],[1,2],[2,2]], [[1,1],[2,1],[1,2],[2,2]]

    # blinker - <2, 2, 3-spawn
    assert_update [[0,2],[1,2],[2,2]], [[1,1],[1,2],[1,3]]

    # toad - ... >3
    assert_update([[1, 1], [1, 2], [2, 3], [3, 0], [4, 1], [4, 2]],
                  [[2,1],[3,1],[4,1], [1,2],[2,2],[3,2]])
    assert_update([[2,1],[3,1],[4,1], [1,2],[2,2],[3,2]],
                  [[1, 1], [1, 2], [2, 3], [3, 0], [4, 1], [4, 2]])
  end

  def assert_update expect, input
    gol.cells = input
    assert gol.update
    assert_equal expect.sort, gol.cells
  end

  def test_neighbors_for
    exp = [[0,0], [1,0], [2,0],
           [0,1],        [2,1],
           [0,2], [1,2], [2,2]].sort

    assert_equal exp, gol.neighbors_for(1,1)

    exp = exp.map { |(x,y)| [x+1, y+1] }
    assert_equal exp, gol.neighbors_for(2,2)

    exp = [       [1,0],
           [0,1], [1,1]].sort
    assert_equal exp, gol.neighbors_for(0,0)
  end
end
