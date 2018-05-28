require_relative "piece.rb"
require_relative "display.rb"
class NoPieceError < StandardError ; end
class CannotMoveError < StandardError ; end

class Board
  attr_accessor :grid

  def initialize
    @grid = [] #{Array.new(8, nil)}
    [0, 1, 6, 7].each do |idx|
      @grid[idx] = Array.new(8, Piece.new)
    end
    (2..5).each do |idx|
      @grid[idx] = Array.new(8, nil)
    end
  end

  def move_piece(start_pos, end_pos)
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

  def valid_space?(pos)
    self[pos].nil? && pos.all? {|el| el < 8 && el > -1}
  end
end
