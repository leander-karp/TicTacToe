require 'tictactoe'
#require 'game/piece'
#require 'game/player'

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
  subject(:playerA) {Player.new('Max', 'X')}
  subject(:playerB) {Player.new('Moritz', 'O')}
  subject(:game) {described_class.new(playerA, playerB)}


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

  describe '#winner' do 
    context 'if the game is a draw' do 
      it 'equals nil' do 
        fill_row(game, 0, [playerA, playerA, playerB])
        fill_row(game, 1, [playerB, playerB, playerA])
        fill_row(game, 2, [playerA, playerB, playerA])
        expect(game.winner).to eq nil
      end 
    end 

    context 'if the game is not over yet' do 
      it 'equals nil if the board is empty' do 
        expect(game.winner).to eq nil
      end 
    end 

    context 'when somebody has won' do 
      it 'equals playerA' do 
        game.make_move(game.current_player, [0,0])
        game.make_move(game.current_player, [0,1])
        game.make_move(game.current_player, [1,1])
        game.make_move(game.current_player, [1,0])
        game.make_move(game.current_player, [2,2])
        expect(game.game_over?).to eq true
        expect(game.winner).to eq playerA
      end 

      it 'equals playerB' do 
        game.make_move(game.current_player, [0,1])
        game.make_move(game.current_player, [0,0])
        game.make_move(game.current_player, [1,0])
        game.make_move(game.current_player, [1,1])
        game.make_move(game.current_player, [2,0])
        game.make_move(game.current_player, [2,2])
        expect(game.game_over?).to eq true
        expect(game.winner).to eq playerB
      end
    end 
  end 

  describe '#current_player' do 
    it 'equals playerA if no move was made' do 
      expect(game.current_player).to eq playerA
    end 

    it 'equals playerB, after playerA made a move' do 
      game.make_move(playerA, [1,1])
      expect(game.current_player).to eq playerB
    end 

    it 'equals playerA, after player B made a move' do 
      game.make_move(playerA, [1,1])
      expect(game.current_player).to eq playerB
      game.make_move(playerB, [0,0])
      expect(game.current_player).to eq playerA
    end 

    it 'equals playerB, if playerB`s move was invalid' do 
      game.make_move(playerA, [1,1])
      game.make_move(playerB, [1,1])
      expect(game.current_player).to eq playerB
    end
  end

  describe '#reset' do 

  end 

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