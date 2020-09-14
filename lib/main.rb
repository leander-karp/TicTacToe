require_relative 'tictactoe'
require_relative 'game/player'

game = TicTacToe.new(
  Player.new('Max', 'X'),
  Player.new('Moritz', 'O'))
game.start
