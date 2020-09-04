require 'game_base/board'

class TicTacToe 
  attr_reader :board

  def initialize
    @board = Board.new(3,3)
  end
    
  def make_move(player, position)
    @board.add(Piece.new(player.icon), position)
  end

  def game_over?
    counter = 0
    (0..3).each { |row_index|
      (0..3).each { |column_index|
        if !@board.get(row_index, column_index).nil?
          counter += 1
        end
      }
    }
    counter == 9 
  end

end