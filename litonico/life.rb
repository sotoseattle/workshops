require 'matrix'
require './matrix_math'

def sum l
  l.reduce :+
end

def twos grid
  grid.map{|i| if i == 2 then 1 else 0 end}
end

def threes grid
  grid.map{|i| if i == 3 then 1 else 0 end}
end

def neighbors grid
  sum( [-1, 0, 1].product([-1, 0, 1]).map{|x, y| grid.rotate x, y } ) - grid
end

def life grid
  ((twos neighbors grid) & grid) | (threes neighbors grid)
end
