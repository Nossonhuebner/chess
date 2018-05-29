require_relative "piece.rb"
require_relative "steppingpiece.rb"
class King
  include SteppingPiece

  def move_diffs
    [[0,1],[1,0], [-1, 0], [0,-1], [1,1], [1,-1], [-1, 1], [-1,-1]]
  end

  def symbol
    "♔".colorize(self.color)
  end

end
