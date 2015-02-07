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

fixpt Matrix.identity(3), &run
