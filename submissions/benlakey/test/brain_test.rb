require "test_helper"

class BrainTest < Minitest::Test
  include ConwayGameOfLife

  attr_reader :subject

  def setup
    @subject = Brain.new
  end

  def test_new_game_has_no_cells
    assert_empty subject.cells
  end

  def test_tick_returns_self
    assert_same subject, subject.tick
  end

  def test_nothing_ticks_to_nothing
    assert_empty subject.tick.cells
  end

  def test_cells_are_tracked
    subject.spawn(5, 2)
    assert_equal [[5, 2]], subject.cells
  end

  def test_single_cell_dies_alone
    subject.spawn(2, 2)
    subject.tick
    assert_empty subject.cells
  end

  def test_isolated_cells_die
    subject
      .spawn(0, 0)
      .spawn(2, 2)
      .spawn(4, 4)
    subject.tick
    assert_empty subject.cells
  end

  def test_reproduction_row
    subject
      .spawn(0, 1)
      .spawn(1, 1)
      .spawn(2, 1)
    subject.tick
    assert_equal [[1, 0], [1, 1], [1, 2]].sort, subject.cells.sort
  end

end
