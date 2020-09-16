require_relative 'tictactoe'
require_relative 'game/player'
require_relative 'game/piece'

class Renderer
  def self.input(current_player_name) 
    puts current_player_name + ' enter your next move:'
    input = gets.chomp.split('').map do |char|
      num = char.to_i
      num if num.to_s == char
    end.compact

    input.slice(0, 2) unless input.length < 2
  end

  def self.print_board(board) 
    board_string = []
    border = '+-+-+-+'

    (0...board.rows).each do |row_index|
      row_data = ['']
      (0...board.columns).each do |column_index|
        piece = board.item_at(row_index, column_index)
        row_data.push(piece.nil? ? ' ' : piece.value)
      end 
      row_data.push('')
      board_string.push(border)
      board_string.push(row_data.join('|'))
    end
    board_string.push(border)
    puts board_string
  end

  def self.game_over_msg(msg)
    puts msg 
  end
end

