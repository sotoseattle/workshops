#!/usr/bin/ruby -w

require "gosu"

# this is coded against gosu v 0.7.47.1, but probably works against
# newer versions (that don't run out of the box, which is why I used
# older)

# DONE array of arrays of bools
# DONE array of x,y pairs
# DONE array of objs that respond to x,y

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
    x2, y2 = x1+9, y1+9
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

class ArrayAdaptor < AbstractAdaptor
  def draw w
    source.each do |(x,y)|
      w.rect x, y
    end
  end
end

class BoolAdaptor < AbstractAdaptor
  def draw w
    source.each do |x, y|
      w.rect x, y
    end
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
# Pseudo-Impls

class GoLArray
  include Enumerable

  attr_accessor :cells

  def initialize
    self.cells = []
    cells << [2, 2]
    cells << [3, 3]
    cells << [4, 4]
  end

  def each &b
    cells.each(&b)
  end

  def update
    # do nothing for now
  end
end

class GoLBools
  include Enumerable

  attr_accessor :cells

  def initialize
    self.cells = [[false, false, false, false, false],
                  [false, false, false, false, false],
                  [false, false,  true, false, false],
                  [false, false, false,  true, false],
                  [false, false, false, false,  true]]
  end

  def each &b
    cells.each_with_index do |row, y|
      row.each_with_index do |test, x|
        b[x, y] if test
      end
    end
  end

  def update
    # do nothing for now
  end
end

class GoLObj
  Cell = Struct.new :x, :y

  include Enumerable

  attr_accessor :cells

  def initialize
    self.cells = []

    cells << Cell.new(2, 2)
    cells << Cell.new(3, 3)
    cells << Cell.new(4, 4)
  end

  def each &b
    cells.each(&b)
  end

  def update
    # do nothing for now
  end
end

############################################################
# Main:

if $0 == __FILE__ then
  adapter_class, model_class = case ARGV.first
                               when "array" then
                                 [ArrayAdaptor, GoLArray]
                               when "bool" then
                                 [BoolAdaptor, GoLBools]
                               when "obj" then
                                 [ObjAdaptor, GoLObj]
                               else
                                 abort "array | bool | obj"
                               end

  window = GameWindow.new adapter_class.new model_class.new
  window.show
end
