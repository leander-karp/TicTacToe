require_relative 'tictactoe'
require_relative 'game/player'
require_relative 'game/piece'

class Renderer
  def input(game)
    puts game.current_player.name + ' enter your next move:'
  end

  
 ##### 
  def XXXinput(game)
    puts 'Enter the board position you like to occupy:'
    input = gets.strip.chomp.split('')
    
    loop do 
      p input
      row_index = input.length==2? input.first.to_i : -2
      column_index = input.length==2? input.last.to_i : -2
      puts column_index, row_index
      success = game.make_move(game.current_player, [row_index, column_index])
      p success
      break if success

      puts 'Invalid input'
      input = gets.strip.chomp.split('')
    end 
  end 
end

