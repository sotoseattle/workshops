require 'minitest/autorun'
require_relative '../lib/gol.rb'

def new_cell_at(x, y)
  Location.new(x, y)
end

class NewGame < Minitest::Test
  def setup
    @empty_game = GOL.new
  end

  def test_has_no_cells
    assert_equal 0, @empty_game.size
  end

  def test_after_a_tick_nothing_changes
    @empty_game.tick
    assert_equal 0, @empty_game.size
  end

  def test_adding_a_new_cell
    @empty_game.add(new_cell_at(0, 0))
    assert_equal 1, @empty_game.size
  end
end

class SingleCellGame < Minitest::Test
  def setup
    @game = GOL.new
    puts @game
    @game.add(new_cell_at(0, 0))
  end

  def test_after_a_tick_a_single_cell_dies_alone
    @game.tick
    assert_equal 0, @game.size
  end
end

class ThreesomeGame < MiniTest::Test
  def test_L_pattern_becomes_block
    game = GOL.new.add(new_cell_at(0, 0))
                  .add(new_cell_at(0, 1))
                  .add(new_cell_at(1, 0))
    game.tick
    assert_equal 4, game.size
  end

  def test_3_in_a_row_rotates
    game = GOL.new.add(new_cell_at(0, 0))
              .add(new_cell_at(0, 1))
              .add(new_cell_at(0, 2))
    game.tick
    assert_equal 3, game.size
    game.tick
    assert_equal 3, game.size
  end

  def test_away_from_each_other_means_death
    game = GOL.new.add(new_cell_at(0, 0))
                  .add(new_cell_at(0, 10))
                  .add(new_cell_at(0, 200))
    game.tick
    assert_equal 0, game.size
  end
end

class MultipleCelledGame < MiniTest::Test
  def test_a_block_of_4_cells_is_stable
    game = GOL.new.add(new_cell_at(0, 0))
                  .add(new_cell_at(0, 1))
                  .add(new_cell_at(1, 0))
                  .add(new_cell_at(1, 1))
    game.tick
    assert_equal 4, game.size
  end
end

