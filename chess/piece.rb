class Piece
  attr_accessor :position, :type
  def initialize
    @type = "O"
    @position
  end
end

class NullPiece < Piece
end
