require 'matrix'
require './matrix_math'

def render grid
  print "\x1b[2J\x1b[H" # Clear the terminal window
  puts matrix.to_s.gsub('1', '#').gsub('0', '.')
end

def fixpt x, &f
  fixpt f.call(x), f
end

def run matrix
  render matrix
  sleep 0.5 # TODO: move to 'render', measure time elapsed
  life matrix
end

fixpt 1 do |x|
  puts x
  x
end

