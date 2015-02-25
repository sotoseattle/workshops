require "gosu"

module ConwayGameOfLife
  class Visualizer < Gosu::Window
    COLOR = Gosu::Color::WHITE

    WIDTH = 800
    HEIGHT = 800
    CELL_SIZE = 20
    CELL_PADDING = 1
    CELLS_X = WIDTH / CELL_SIZE
    CELLS_Y = WIDTH / CELL_SIZE
    TICK_DELAY = 200

    def initialize(brain)
      super(WIDTH, HEIGHT, false, TICK_DELAY)
      self.caption = "Conway's Game of Life"
      @brain = brain
    end

    def update
      brain.tick
    end

    def draw
      brain.cells
        .select { |(x, y)| x.between?(0, CELLS_X) && y.between?(0, CELLS_Y) }
        .each { |(x, y)| draw_cell(x, y) }
    end

    def button_down(id)
      close if id == Gosu::KbEscape
    end

    def draw_cell(x, y)
      x1, y1 = x * CELL_SIZE, y * CELL_SIZE
      cell_dimension = CELL_SIZE - CELL_PADDING
      x2, y2 = x1 + cell_dimension, y1 + cell_dimension
      draw_quad(x1, y1, COLOR, x1, y2, COLOR, x2, y2, COLOR, x2, y1, COLOR)
    end
    
    private

    attr_reader :brain

  end
end
