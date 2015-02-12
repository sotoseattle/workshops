### Conway's Game of Life (according to Javier Soto)

#### Mimimal Functional Approach

A single module, where the main funtion is ``tick''

The input is an array of living cells. Each cell is represented by its location as a subarray [x, y].

The ouput is the same as the input, another array of living cells after a tick of the clock has passed.

The code couldn't be simpler:

```ruby
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
```

Additionally I have added:

- lib/visualization.rb: a class to visualize a finite grid tied to a GoL
- GoL: an executable with a loaded pattern.

The visualization tool I used requires the GOSU gem [website](http://www.libgosu.org/) & [github](https://github.com/jlnr/gosu). Make sure to read the installation requirements because in some systems is a bit picky.

Gosu makes it extremelly easy to set up the visualization of the board.

####To Run

With my Visualization class:

```bash
$ ./GoL
```

With Ryan's Visualization Adaptor

```bash
$ ruby play.rb
```

