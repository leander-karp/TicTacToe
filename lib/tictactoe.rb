require_relative 'game/board'
require_relative 'renderer'

class TicTacToe 
  attr_reader :board, :current_player

  def initialize(first_player, second_player)
    @first_player   = first_player
    @second_player  = second_player
    @current_player = @first_player
    @board          = Board.new(3, 3)
  end

  def start
    while !game_over?
      Renderer.print_board(board)

      next_move = Renderer.input(current_player.name)
      while next_move.nil?
        next_move = Renderer.input(current_player.name)
      end

      make_move(current_player, next_move)
    end

    msg = winner.nil? ? 'Draw!' : winner.name + ' won.'
    Renderer.game_over_msg(msg)
  end 

  def make_move(player, position)
    move_success = @board.add(Piece.new(player.icon), position)
    if move_success
      @current_player = player.equal?(@first_player)? @second_player : @first_player
    end
    move_success
  end

  def game_over?
    board.full? || !fetch_winner_piece.nil?
  end

  def winner 
    @first_player.owns_piece?(fetch_winner_piece) ? @first_player : @second_player unless fetch_winner_piece.nil?
  end

  private 
  def fetch_winner_piece 
    (0...board.rows).each do |row_index|
      if board.row_equal_piece(row_index)
        return board.item_at(row_index, 0)
      end
    end

    (0...board.columns).each do |column_index|
      if board.column_equal_piece(column_index)
        return board.item_at(0, column_index)
      end
    end

    board.diagonal_equal_piece(0, 0, 1, 1) || 
    board.diagonal_equal_piece(2, 0, -1, 1) 
  end 
end