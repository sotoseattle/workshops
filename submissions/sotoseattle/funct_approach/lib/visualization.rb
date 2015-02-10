require 'gosu'
require_relative 'gol'

include GOL

class Visualization < Gosu::Window
  GREEN = Gosu::Color::GREEN
  BLACK = Gosu::Color::BLACK
  SIDE_PIXELS = 800 # the window will always be 800 pixels wide/high
  SIDE_CELLS  = 160 # user can choose how many cells per side of the board

  def initialize(board, side = SIDE_CELLS)
    @board = board
    @side = side
    @r = SIDE_PIXELS / @side

    super(SIDE_PIXELS, SIDE_PIXELS, false)
    self.caption = 'Conway\'s Game of Life'
  end

  def update
    @board = GOL::tick(@board)
    @board.delete_if { |x, y| x < 0 || y < 0 || x > @side - 1 || y > @side - 1 }
  end

  def draw
    draw_quad(0, 0, BLACK, @side, 0, BLACK, 0, @side, BLACK, @side, @side, BLACK)

    @board.each do |x, y|
      draw_quad(x * @r,            y * @r,            GREEN,
                x * @r + (@r - 1), y * @r,            GREEN,
                x * @r + (@r - 1), y * @r + (@r - 1), GREEN,
                x * @r,            y * @r + (@r - 1), GREEN)
    end
  end

  def button_down(id)
    close if id == Gosu::KbEscape
  end
end

