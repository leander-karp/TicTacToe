require 'tictactoe'
require 'game_base/board'
require 'game_base/piece'
require 'game_base/player'

RSpec.describe TicTacToe do 
  subject(:game) {described_class.new}
  subject(:playerA) {Player.new('Max', 'X')}
  subject(:playerB) {Player.new('Moritz', 'O')}

describe '#start'
  describe '#game_over?' do 
    it 'equals true if there are 3 in a row' do 
      board = Board.new
      board.add(Piece.new('X'), [1,1])
    end 
  end 
  describe '#winner'
  describe '#current_player'
  describe '#make_move' do 
    context 'when given a player and a valid position' do 
      it 'equals true' do 
        expect(game.make_move(playerA, [1,1])).to be true 
      end 
    end
  end
end 