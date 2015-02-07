require 'matrix'

# Things wrong with Matrix:
#
# Enumerable methods return arrays, not matrices (zip),
# except when they don't (map)
#
# There's no way to get a Matrix from an array of arrays
#
# Inverse only retuns rationals

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

  # Bitwise operations on boolean matrices
  def & other
    Matrix.Raise ErrDimensionMismatch unless
      self.row_count == other.row_count and
      self.column_count == other.column_count

    Matrix.build(self.row_count){|i, j| self[i, j] & other[i, j] }
  end

  def | other
    Matrix.Raise ErrDimensionMismatch unless
      self.row_count == other.row_count and
      self.column_count == other.column_count

    Matrix.build(self.row_count){|i, j| self[i, j] | other[i, j] }
  end

end
