# Ruby Romp Workshop

Seattle.rb Study Group repository for Seattle.rb Ruby Workshopping.

To get access, create a pull request to get permissions to push your changes.

Setup
=====

Feel free to create a directory for your account name (like mine: /SeaRbSg/sotoseattle) and submit any code. Please make sure to follow Ryan's James Brown Guide to git etiquette:

[alias]
down = pull --rebase
onup = push

Now you too can join the James Brown school of git:

git down && git onup

Session I: Game of Life (gol)
=============================

Seattle.rb Study Group repository for workshop code based on the "Game of Life" (aka gol). Create a folder called "gol" inside your personal folder (i.e. SeaRbSg/sotoseattle/gol).

Table of Contents
-----------------

- [GOL](#gol)
- [Rules](#rules)
- [How to go about it](#how-to-go-about-it)
- [Visualization](#visualization)

GOL
===


Rules
=====

Game of Life "exists" in an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, dead or alive. Every cell interacts with its eight neighbors, which are the cells that are directly horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

- Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
- Any live cell with more than three live neighbours dies, as if by overcrowding.
- Any live cell with two or three live neighbours lives on to the next generation.
- Any dead cell with exactly three live neighbours becomes a live cell.

The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed. Births and deaths happen simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the one before). The rules continue to be applied repeatedly to create further generations.

How to go about it (testing)
============================

How do we know that our code of GOL is behaving as it should? The intuitive answer is because we can see with our own eyes how cells are created and destroyed at each moment. We see how they evolve, therefore we believe it works.

The reality is that it is not necessary to see to believe (although it surely helps!). It is all about testing. You don't need to visualize the board to check that the code behaves as it should. The best way is through thorough testing.

So make sure you test well. It is an art in itself. For example, start by implementing an empty game, then add the simplest scenario and start implementing the rules (see above). In no time you'll see how the code evolves before your own eyes.

Check example of tests here:
  - ...
  - ...
  - ...

To put the cherry on top, feel free to tinker with and add the visualization tool explained below.


Visualization
=============

Ryan Davis has been generous enough to add the following ...

You can find the code inside the folder ``coding_tools/gol_visualization/". Check the README file to see how to use it with your code.

