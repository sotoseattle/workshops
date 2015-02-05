### Conway's Game of Life (according to Javier Soto)

The main classes that set up the game and enforce the rules are:

- gol: the controller of the game, controls space and time, board and clock.
- space: the board or infinite grid of cells.
- time\_arrow: the clock that determines the passage of time.
- location: a specific square in the grid.

The above classes constitutes a valid Game of Life.

The tests are written for the above classes. Or better said, the above classes are coded to pass the included tests.

Additionally I have added:

- lib/visualization.rb: a class to visualize a finite grid tied to a GoL
- bin/GoL: an executable that:
    - includes the aforementioned core classes.
    - allows you to directly input a seeded board into the game.
    - ties the resulting GoL to the Visualization window.

The visualization tool I used requires the GOSU gem [website](http://www.libgosu.org/) & [github](https://github.com/jlnr/gosu). Make sure to read the installation requirements because in some systems is a bit picky.

