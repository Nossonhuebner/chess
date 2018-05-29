require_relative "piece.rb"
require_relative "SlidingPiece.rb"

class Queen < Piece

  include SlidingPiece

  def move_dirs
    dirs = [[0,1],[1,0], [-1, 0], [0,-1], [1,1], [1,-1], [-1, 1], [-1,-1]]
  end

  def symbol
    "♕".colorize(self.color)
  end

end
