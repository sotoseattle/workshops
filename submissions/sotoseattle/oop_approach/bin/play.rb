#!/usr/bin/ruby -w

require "gosu"

# this is coded against gosu v 0.7.47.1, but probably works against
# newer versions (that don't run out of the box, which is why I used
# older)

class GameWindow < Gosu::Window
  C = Gosu::Color::WHITE

  attr_accessor :adaptor

  def initialize adaptor
    super 800, 800, false
    self.caption = "Conway's Game of Life"
    self.adaptor = adaptor
  end

  def update
    adaptor.update
  end

  def draw
    adaptor.draw self
  end

  def button_down id
    close if id == Gosu::KbEscape
  end

  def rect x, y
    x1, y1 = x*10, y*10
    x2, y2 = x1+10, y1+10
    draw_quad x1, y1, C, x1, y2, C, x2, y2, C, x2, y1, C
  end
end

############################################################
# Adaptors

class AbstractAdaptor
  attr_accessor :source

  def initialize source
    self.source = source
  end

  def update
    source.update
  end
end

class ObjAdaptor < AbstractAdaptor
  def draw w
    source.each do |obj|
      w.rect obj.x, obj.y
    end
  end
end

############################################################
# Main:

pattern = "
...........OO...........OO
...........OO...........OO


......O.......................O
.....O.O.....O.........O.....O.O
....O..O.....O.OO...OO.O.....O..O
.....OO..........O.O..........OO
...............O.O.O.O
................O...O

OO.................................OO
OO.................................OO
.....OO.......................OO

......O.O...................O.O
......O..O.................O..O
.......OO...................OO

.......OO...................OO
......O..O.................O..O
......O.O...................O.O

.....OO.......................OO
OO.................................OO
OO.................................OO

................O...O
...............O.O.O.O
.....OO..........O.O..........OO
....O..O.....O.OO...OO.O.....O..O
.....O.O.....O.........O.....O.O
......O.......................O


...........OO...........OO
...........OO...........OO"

require_relative '../lib/gol'
require 'forwardable'

class GOL
  extend Forwardable

  def_delegators :world, :each   # cause @world is already Enumerable!
  alias_method :update,  :tick
end

game = GOL.new

pattern.split("\n").each_with_index do |line, i|
  line.chars.each_with_index do |x, j|
    game.add(Location.new(i+5, j+7)) if x == "O"
  end
end

window  = GameWindow.new(ObjAdaptor.new(game))
window.show

