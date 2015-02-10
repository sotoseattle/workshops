module GOL
  def tick(living)
    potential = living.map { |c| neighbors(c) }.flatten(1).uniq - living

    new_board = living.select { |cell| alive_around(cell, living).between?(2, 3) }
    new_board += potential.select { |cell| alive_around(cell, living) == 3 }

    return new_board
  end

  private

  def neighbors(cell)
    x, y = cell
    [x + 1, x, x - 1].product([y - 1, y, y + 1]) - [[x, y]]
  end

  def alive_around(cell, board)
    neighbors(cell).count { |c| board.include? c }
  end
end

