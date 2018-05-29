require_relative "piece.rb"
require_relative "display.rb"
require_relative "rook.rb"
require_relative "bishop.rb"
require_relative "king.rb"
require_relative "knight.rb"
require_relative "nullpiece.rb"
require_relative "pawn.rb"
require_relative "queen.rb"

class NoPieceError < StandardError ; end
class CannotMoveError < StandardError ; end

class Board
  attr_accessor :grid

  def initialize(board = nil)
    if board
      @grid = board
    else
      @grid = [] #{Array.new(8, nil)}



      @grid[0] = [Rook.new(:black, nil, [0,0]), Knight.new(:black, nil, [0,1]),
                  Bishop.new(:black, nil, [0,2]), Queen.new(:black, nil, [0,3]),
                King.new(:black, nil, [0,4]), Bishop.new(:black, nil, [0,5]),
                Knight.new(:black, nil, [0,6]), Rook.new(:black, nil, [0,7])]

      i = 0
      arr = []
      while i < 8
        arr << Pawn.new(:black, nil, [1, i])
        i += 1
      end
      @grid[1] = arr

      (2..5).each do |idx|
        @grid[idx] = Array.new(8, NullPiece.instance)
      end

      i = 0
      arr = []
      while i < 8
        arr << Pawn.new(:white, nil, [6, i])
        i += 1
      end
      @grid[6] = arr

      @grid[7] = [Rook.new(:white, nil, [7,0]), Knight.new(:white, nil, [7,1]),
                  Bishop.new(:white, nil, [7,2]), Queen.new(:white, nil, [7,3]),
                King.new(:white, nil, [7,4]), Bishop.new(:white, nil, [7,5]),
                Knight.new(:white, nil, [7,6]), Rook.new(:white, nil, [7,7])]


    end
  end

  def move_piece!(color, start_pos, end_pos)
    if start_pos == nil
      raise NoPieceError.new("No Piece Selected")
    elsif !valid_space?(end_pos)
      raise CannotMoveError.new ("Invalid End Position")
    end
    self[start_pos].position = end_pos
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, arg)
    row, col = pos
    @grid[row][col] = arg
  end

  def valid_pos?(pos)
    self[pos].nil? && pos.all? {|el| el < 8 && el > -1}
  end

  def add_piece(piece,pos)
  end

  def checkmate?(color)
  end

  def in_check?(color)
    king_pos = find_king(color)

  end

  def find_king(color)
    self.grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        return [row_idx, col_idx] if col.is_a?(King) && col.color? == :black
      end
    end
  end

  def pieces
  end

  def move_piece(color, start_pos, end_pos)
    temp_arr = self.grid.dup
    temp_board = Board.new(temp_arr)
    temp_board.move_piece!(color, start_pos, end_pos)
  end

  def dup
    new_array = []
    self.each do |el|
      new_array << (el.is_a?(Array) ? el.deep_dup : el)
    end
    new_array
  end

end
