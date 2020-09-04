require 'tictactoe'
require 'game_base/piece'
require 'game_base/player'

def fill_row(game, row, players)
  (0...3).each do |index|
    game.make_move(players[index], [row, index])
  end
end

def fill_column(game, column, players)
  (0...3).each do |index|
    game.make_move(players[index], [index, column])
  end
end 

RSpec.describe TicTacToe do 
  subject(:game) {described_class.new}
  subject(:playerA) {Player.new('Max', 'X')}
  subject(:playerB) {Player.new('Moritz', 'O')}

  describe '#start'
  describe '#game_over?' do 
    it 'equals false if the board is empty' do 
      expect(game.game_over?).to be false
    end 

    it 'equals true if the board is full' do 
      fill_row(game, 0, [playerA, playerA, playerB])
      fill_row(game, 1, [playerB, playerB, playerA])
      fill_row(game, 2, [playerA, playerB, playerA])
      expect(game.game_over?).to be true
    end 

    context 'if there a three equal pieces in a row' do 
      it 'returns true if it is the first row' do 
        fill_row(game, 0, [playerA, playerA, playerA])
        expect(game.game_over?).to be true
      end 
      it 'returns true if it is the second row' do 
        fill_row(game, 1, [playerA, playerA, playerA])
        expect(game.game_over?).to be true
      end      
      it 'returns true if it is the third row' do 
        fill_row(game, 2, [playerA, playerA, playerA])
        expect(game.game_over?).to be true
      end   
    end 

    context 'if there are three equal pieces in a column' do 
      it 'returns true if it is the first column' do 
        fill_column(game, 0, [playerB, playerB, playerB])
        expect(game.game_over?).to be true
      end
    end

    it 'equals true if there are three equal pieces in diagonal order' do 
      fill_row(game, 0, [playerB, playerA, playerA])
      fill_row(game, 1, [playerB, playerA, playerA])
      game.make_move(playerA, [2,0])
      expect(game.game_over?).to be true
    end 
    it 'equals true if there are three equal pieces in diagonal order' do 
      fill_row(game, 0, [playerA, playerA, playerB])
      fill_row(game, 1, [playerA, playerA, playerB])
      game.make_move(playerA, [2,2])
      expect(game.game_over?).to be true
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
  describe '#reset'

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