require_relative 'tictactoe'
require_relative 'game/player'
require_relative 'game/piece'

class Renderer
  def self.input(game)
    puts game.current_player.name + ' enter your next move:'
    input = gets.chomp.split('').map do |char|
      num = char.to_i
      num if num.to_s == char
    end.compact

    input.slice(0, 2) unless input.length < 2
  end

  def self.print_board(game)
    board_string = []
    border = '+-+-+-+'

    for row_index in 0...game.board.rows
      row_data = ['']
      for column_index in 0...game.board.columns 
        piece = game.board.get(row_index, column_index)
        row_data.push(piece.nil? ? ' ' : piece.value)
      end 
      board_string.push(border)
      row_data.push('')
      board_string.push(row_data.join('|'))
    end
    board_string.push(border)
    puts board_string
  end
end

