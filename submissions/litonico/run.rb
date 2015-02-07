require 'matrix'
require './matrix_math'
require './life'

def render matrix
  print "\x1b[2J\x1b[H" # Clear the terminal window
  puts matrix.to_s.gsub('1', '#').gsub('0', '.')
end

def fixpt x, &f
  fixpt f.call(x), &f
end

run = lambda do |matrix|
  render matrix
  sleep 0.2
  life matrix
end

matrix = Matrix[[0, 1, 1],
                [1, 1, 0],
                [0, 1, 0]].take(10, 10).rotate(-5, -5)

fixpt matrix, &run
