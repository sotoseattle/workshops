require 'minitest/autorun'
require_relative '../lib/gol.rb'

include GOL

class NewGame < Minitest::Test
  def test_after_a_tick_nothing_changes
    assert_equal [], GOL.tick([])
  end
end

class SingleCellGame < Minitest::Test
  def test_after_a_tick_a_single_cell_dies_alone
    assert_equal [], GOL.tick([[0, 0]])
  end
end

class ThreesomeGame < MiniTest::Test
  def test_L_pattern_becomes_block
    ele = [[0, 0], [0, 1], [1, 0]]
    assert_equal 4, GOL.tick(ele).size
    assert_includes GOL.tick(ele), [1, 1]
    assert_includes GOL.tick(ele), [0, 0]
    assert_includes GOL.tick(ele), [0, 1]
    assert_includes GOL.tick(ele), [1, 0]
  end

  def test_3_in_a_row_rotates
    bar = [[0, 0], [0, 1], [0, 2]]
    assert_equal 3, GOL.tick(bar).size
    assert_includes GOL.tick(bar), [1, 1]
    assert_includes GOL.tick(bar), [0, 1]
    assert_includes GOL.tick(bar), [-1, 1]
  end

  def test_away_from_each_other_means_death
    assert_equal [], GOL.tick([[0, 1], [10, 10], [0, -200]])
  end
end

class MultipleCelledGame < MiniTest::Test
  def test_a_block_of_4_cells_is_stable
    block = [[0, 0], [0, 1], [1, 0], [1, 1]]
    assert_equal block, GOL.tick(block)
  end
end

