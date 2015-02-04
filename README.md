# Seattle Ruby Workshops

Feel free to fork this repo and code away!

##Session I: Game of Life (GoL)
<img src="/public/images/Game_of_life_pulsar.gif" width="200" align="right"/>

- [GoL](#gol)
- [How to go about it](#how-to-go-about-it)
- [Visualization](#visualization)
- [Constraints](#constraints)
- [Resources](#resources)

GoL
===


Game of Life "exists" in an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, dead or alive. Every cell interacts with its eight neighbors, which are the cells that are directly horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

- Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
- Any live cell with more than three live neighbours dies, as if by overcrowding.
- Any live cell with two or three live neighbours lives on to the next generation.
- Any dead cell with exactly three live neighbours becomes a live cell.

The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed. Births and deaths happen simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the one before). The rules continue to be applied repeatedly to create further generations.

Check online an [interactive example](http://pmav.eu/stuff/javascript-game-of-life-v3.1.1/)

How to go about it
==================

How do we know that our code of GoL works as it should? The intuitive answer is because we can see with our own eyes how cells are created and destroyed at each moment. We see how they evolve, therefore we believe it works.

It is not necessary to see to believe (although it surely helps!). A much better way to go about it by testing thoroughly. Testing is an art in itself.

As an example, you can start by implementing an empty game, then add the simplest scenario possible and only then start adding test for each of the four rules of the game:

  - A new game has no cells
  - A new game after a tick ... nothing changes
  - A new game, when I add a new live cell, after a tick the single cell dies alone
  - A game with 3 cells distant from each other (0,0 : 0,10 : 20,20), after a tick, they all die!!
  - A game with 3 cells in a row (0,1 : 0,2 : 0,3), rotates as the clock ticks, and 3 cells always remain!
  - A game with 3 initial cells in L formation (0,0 : 0,1 : 1,0), after a tick of the clock, we have a solid block of 4 living cells.
  - A game with a block of 4 cells (0,0 : 0,1 : 1,0 : 1,1), stays stable and does not change as the clock ticks.

Visualization
=============

Ryan Davis will add a small utility class to visualize GoL so we can focus on getting the rules implementation right.

You will find the code inside the folder ``coding_tools/gol_visualization/" in the next few days.

Constraints
============

Once you are familiar with the Game of Life, and you have your own coding solution, the fun begins. In the workshop we will recode GoL from scratch but with additional constraints. Possible constraints are:

* **Methods cannot have more than 3 lines**.
* **No conditional statements**. Be creative and find other ways to achieve the same results (i.e. type-based polymorphism, lookup tables).
* **No primitives** across method boundaries (input or output). Cannot pass around data primitives (booleans, numbers or strings). Neither you can pass primitive data structures such as arrays, lists or Enumerables.
* **Mute ping-pong pairing**. Like what Aaron and Ryan did last month with the Gilded Rose kata. One writes the tests, the other writes the code to pass those tests. They can only communicate through tests and code. Comments not allowed.
* **No return values**. Your methods cannot return values. Instead, use message passing between objects.

* **Object Calisthenics**. You can find even more possible constraints in the document included in public/ folder: "9 steps to better software design today", by Jeff Bay:

    1. One level of indentation per method
    2. Don’t use the ELSE keyword
    3. Wrap all primitives and Strings
    4. First class collections
    5. One dot per line
    6. Don’t abbreviate
    7. Keep all entities small
    8. No classes with more than two instance variables
    9. No getters/setters/properties

We will summarize the best constraints in the Wheel of Misfortune for you to play with. Nevertheless, you are free to pick and choose whatever constraints you want to apply, so feel free to be creative.

Resources
=========

####General

* [Conway's Game of Life](http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life), from Wikipedia.
* [The original article from 1970](http://www.ibiblio.org/lifepatterns/october1970.html) that publicized GoL, from Martin Gardner in Scientific American.
* ["Understanding the 4 rules of simple design"](www.coreyhaines.com), by Corey Haines. Lessons from watching thousands of pairs work on Conway's Game of Life.
* [GoL Community and related cellular automata](http://conwaylife.com/)

####Visualizations

* [A must see video!](https://www.youtube.com/embed/C2vgICfQawE)
* [Mind-blowing demo in APL](https://t.co/YcxBavIj4b), HT Lito Nicolai (@lito_nico).
* [Interactive example](http://pmav.eu/stuff/javascript-game-of-life-v3.1.1/)

####Curious

* [Patterns and resources](http://www.ibiblio.org/lifepatterns/)
* [Turing Machine made of GoL](http://rendell-attic.org/gol/tm.htm)
* [Primes calculator with GoL](http://pentadecathlon.com/lifeNews/2010/02/prime_numbers.html)

####Code

* [GoL coded in 70 different languages](http://rosettacode.org/wiki/Conway%27s_Game_of_Life)
* [in HTML5](http://www.julianpulgarin.com/canvaslife/)
* [An algorithm for compressing space and time](http://www.drdobbs.com/jvm/an-algorithm-for-compressing-space-and-t/184406478)
* [Github search](https://github.com/search?utf8=%E2%9C%93&q=conway+game+of+life)

