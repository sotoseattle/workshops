require 'gosu'

class Visualization < Gosu::Window
  GREEN = Gosu::Color::GREEN
  BLACK = Gosu::Color::BLACK
  SIDE_PIXELS = 800 # the window will always be 800 pixels wide/high
  SIDE_CELLS  = 160 # user can choose how many cells per side of the board

  def initialize(gol, side = SIDE_CELLS)
    @gol = gol
    @side = side
    @r = SIDE_PIXELS / @side

    super(SIDE_PIXELS, SIDE_PIXELS, false)
    self.caption = 'Conway\'s Game of Life'
  end

  def update
    @gol.tick
    kill_unseen_cells(@gol) # in visualization mode, the grid is not infinite
  end

  def draw
    draw_quad(0, 0, BLACK, @side, 0, BLACK, 0, @side, BLACK, @side, @side, BLACK)

    @gol.world.each do |cell|
      draw_quad(cell.x * @r,            cell.y * @r,            GREEN,
                cell.x * @r + (@r - 1), cell.y * @r,            GREEN,
                cell.x * @r + (@r - 1), cell.y * @r + (@r - 1), GREEN,
                cell.x * @r,            cell.y * @r + (@r - 1), GREEN)
    end
  end

  private

  def kill_unseen_cells(gol)
    @gol.world.delete_if do |loc|
      loc.x <= -1 || loc.y <= -1 || loc.x >= @side + 1 || loc.y >= @side + 1
    end
  end
end

