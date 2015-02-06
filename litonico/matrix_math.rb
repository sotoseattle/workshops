require 'matrix'

class Matrix

  def to_s
    # Pretty printing!
    self.to_a.map{|row| row.join " "}.join "\n"
  end

  def shift_x i
    # I can't find a neat matrix-math solution for
    # this, so let's do it with regular 'ol `map`.
    Matrix[ *self.to_a.map {|row| row.rotate i} ]
  end

  def shift_y i
    # A matrix can be cyclically shifted by
    # multiplying it by a permutation matrix:
    #
    # 0 0 0 1
    # 1 0 0 0
    # 0 1 0 0
    # 0 0 1 0
    #
    # (Just the identity matrix shifted cyclically)

    shift_matrix = Matrix.build(self.column_count, self.row_count) do |r, c|
      if r == 0 and c == self.column_count - 1
        1
      elsif r == c + 1
        1
      else
        0
      end
    end

    self * shift_matrix ** i
  end

  # Operations on boolean matrices
  # TODO: If matrix implements Enumerable, can you zip them?
  def & other
    Matrix [ *self.to_a.map{|row| row.map{|col| col & row }} ]
  end

  def | other
    Matrix [ *self.to_a.map{|row| row.map{|col| col | row }} ]
  end

end
