module SlidingPiece
  def moves
    dirs = self.move_dirs
    pos = self.pos
    potential_moves = []
    dirs.each do |dir|
      pos_row, pos_col = pos
      row, col = dir
      until pos_row > 6 || pos_col > 6 || pos_col < 1 || pos_row < 1
        pos_row += row
        pos_col += col
        potential_moves << [pos_row, pos_col]
      end
    end
    potential_moves
  end

  
end
