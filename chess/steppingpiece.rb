module SteppingPiece

  def moves
    diffs = move_diffs
    diffs = diffs.map do |diff|
      d_row, d_col = diff
      row, col = pos
      [d_row + row, d_col + col]
    end
    diffs.reject do |move|
      move.any? { |coord| coord > 7 || coord < 0  }
    end
  end







end
