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
        temp_pos = [pos_row, pos_col]
        # break unless self.board[temp_pos].is_a?(NullPiece.rb)
         break if self.board[temp_pos].color == self.color
        potential_moves << temp_pos
        break if self.board[temp_pos].color != self.color && self.board[temp_pos].color != :null
      end
    end
    potential_moves
  end

  private

  def move_dirs
  end
end
