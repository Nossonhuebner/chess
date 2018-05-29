require_relative "piece.rb"
class Rook < piece


  def move_dirs
    dirs = [[0,1],[1,0],[-1, 0], [0,-1]]
  end

  def symbol
    "♖".colorize(self.color)
  end

end
