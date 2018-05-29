require_relative "piece.rb"
require_relative "steppingpiece.rb"

class Knight < Piece
  include SteppingPiece

  def symbol
    "♞".colorize(self.color)
  end

  private

  def move_diffs
    moves = []
    (-2..2).each do |idx1|
      next if idx1 == 0
      (-2..2).each do |idx2|
        next if idx2 == 0 || idx2.abs == idx1.abs

        moves << [idx1, idx2]
      end
    end
    moves
  end









end
