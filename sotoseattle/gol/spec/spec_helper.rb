require 'coveralls'
Coveralls.wear!

require 'minitest/autorun'
require './lib/game_of_life'
require './lib/world'
require './lib/location'

def new_cell_at(x, y)
  Location.new(x, y)
end
