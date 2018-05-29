require_relative "piece.rb"
require_relative "SlidingPiece.rb"

class Bishop < Piece

  include SlidingPiece

  def move_dirs
    dirs = [[1,1],[1,-1],[-1, 1], [-1,-1]]
  end

  def symbol
    "♗".colorize(self.color)
  end
end
