module ConwayGameOfLife
  class Brain

    attr_accessor :cells

    def initialize
      @cells = []
    end

    def spawn(x, y)
      cells << [x, y]
      self
    end

    def tick
      alive = reproduce_candidates
      dead = (reap_candidates - alive)
      self.cells = (cells - dead + alive).uniq
      self
    end

    private

    def reap_candidates
      cells.select { |(x, y)| !neighbors(x, y).length.between?(2, 3) }
    end

    def reproduce_candidates
      cells
        .map { |(x,y)| search_space(x, y) }
        .flatten(1).uniq
        .select { |(x,y)| !cells.include?([x, y]) }
        .select { |(x,y)| neighbors(x, y).length == 3 }
    end

    def neighbors(x, y)
      search_space(x, y).select { |(x, y)| cells.include?([x, y]) }
    end

    def search_space(x, y)
      xspace = [x - 1, x, x + 1]
      yspace = [y - 1, y, y + 1]
      xspace.product(yspace) - [[x, y]]
    end

  end
end
