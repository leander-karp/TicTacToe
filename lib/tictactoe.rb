require 'game/board'

class TicTacToe 
  attr_reader :board, :current_player

  def initialize(first_player, second_player)
    @first_player   = first_player
    @second_player  = second_player
    @current_player = @first_player
    @board          = Board.new(3,3)
  end

  def make_move(player, position)
    move_success = @board.add(Piece.new(player.icon), position)
    if move_success
      @current_player = player.equal?(@first_player)? @second_player : @first_player
    end
    move_success
  end

  def game_over?
    row_or_column_win = (0...3).map do |index| 
      row_elements_equal?(index) || column_elements_equal?(index)
    end.any?
    
    board.all? || diagonal_elements_equal? || row_or_column_win
  end

  def winner 
    if self.game_over?
      current_player.equal?(@first_player)? @second_player : @first_player
    end
  end

  private 
  def diagonal_elements_equal?
    top_left      = board.get(0,0)
    top_right     = board.get(0,1)
    center        = board.get(1,1)
    bottom_left   = board.get(2,0)
    bottom_right  = board.get(2,2)

    !center.nil? && (
      (top_left==center && bottom_right==center) || 
      (top_right==center && bottom_left==center))
  end 

  def row_elements_equal?(row_index)
    a = board.get(row_index,0)
    b = board.get(row_index,1) 
    c = board.get(row_index,2)
    !a.nil? && a==b && b==c
  end

  def column_elements_equal?(column_index)
    a = board.get(0, column_index)
    b = board.get(1, column_index) 
    c = board.get(2, column_index)
    !a.nil? && a==b && b==c
  end
end