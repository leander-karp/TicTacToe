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

  describe '#board' do 
    it 'equals a valid 3x3 tic tac toe board' do 
      expect(game.board.number_of_rows).to eq 3 
      expect(game.board.number_of_colums).to eq 3
    end 
  end

  describe '#winner'
  describe '#current_player'
  describe '#make_move' do 
    context 'when given a player and a position' do 
      it 'sets a Piece and returns true' do 
        expect(game.make_move(playerA, [1,1])).to be true
        expect(game.board.get(1,1)).to eq Piece.new(playerA.icon) 
      end 

      it 'equals false if the position is occupied' do 
        game.make_move(playerA, [1,1])
        expect(game.make_move(playerB, [1,1])).to be false 
        expect(game.board.get(1,1)).to eq Piece.new(playerA.icon) 
      end
    end
  end
end 