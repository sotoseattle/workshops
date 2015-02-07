require 'matrix'

# Things wrong with Matrix:
#
# Enumerable methods return arrays, not matrices (zip),
# except when they don't (map)
#
# There's no way to get a Matrix from an array of arrays
#
# Inverse is broken

class Matrix

  # Pretty printing!
  def to_s
    self.to_a.map{|row| row.join " "}.join "\n"
  end

  def shift x, y
    # I can't find a neat matrix-math solution for
    # this, so let's do it with regular 'ol `map`.
    Matrix[ *self.to_a.rotate(y).map {|row| row.rotate x} ]
  end

  def & other
    self.zip(other).map{|i, j| i & j}
  end

  def | other
    self.zip(other).map{|i, j| i | j}
  end

end
