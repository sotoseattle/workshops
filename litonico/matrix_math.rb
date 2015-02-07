require 'matrix'

class Matrix

  # Pretty printing!
  def to_s
    self.to_a.map{|row| row.join " "}.join "\n"
  end

  def rotate x, y
    # I can't find a neat matrix-math solution for
    # this, so let's do it with regular 'ol `map`.
    Matrix[ *self.to_a.rotate(y).map {|row| row.rotate x} ]
  end

  # Pad or shrink a matrix
  def take x, y
    Matrix.build(y, x){|i, j| if self[i, j].nil? then 0 else self[i, j] end }
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
