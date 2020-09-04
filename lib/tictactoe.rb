require 'game_base/board'

class TicTacToe 
  attr_reader :board

  def initialize
    @board = Board.new(3,3)
  end
    
  def make_move(player, position)
    @board.add(Piece.new(player.icon), position)
  end

end