require 'renderer'
require 'tictactoe'
require 'game/player'
require 'game/piece'

RSpec.describe Renderer do 
  let(:playerA) {Player.new('Max', 'O')}
  let(:playerB) {Player.new('Moritz', 'X')}

  let(:game) {TicTacToe.new(playerA, playerB)}

  describe '#input' do
    it 'addresses the current player' do 
      msg = game.current_player.name + " enter your next move:\n"
      allow(described_class).to receive(:gets).and_return('')
      expect{described_class.input(game)}.to output(msg).to_stdout
    end 

    it 'retrieves a valid position and returns it as an array of integers' do 
      allow(described_class).to receive(:gets).and_return('11')
      expect(described_class.input(game)).to eq [1,1]
    end

    it 'equals nil if the input is empty' do 
      allow(described_class).to receive(:gets).and_return('')
      expect(described_class.input(game)).to eq nil
    end 

    it 'equals nil if there is only one char' do 
      allow(described_class).to receive(:gets).and_return('1')
      expect(described_class.input(game)).to eq nil
    end 

    it 'equals an array of the size 2 if the input is longer' do 
      allow(described_class).to receive(:gets).and_return('123')
      expect(described_class.input(game).size).to eq 2
    end 

    it 'equals nil if the input is 1a' do 
      allow(described_class).to receive(:gets).and_return('1a')
      expect(described_class.input(game)).to eq nil
    end

  end 

  describe '#print_board' do 
    it 'prints the empty board' do 
      expected_board = "+-+-+-+\n| | | |\n+-+-+-+\n| | | |\n+-+-+-+\n| | | |\n+-+-+-+\n"
      expect{described_class.print_board(game)}.to output(expected_board).to_stdout
    end

    it 'prints the board correctly after a move was made' do 
      expected_board = "+-+-+-+\n|O| | |\n+-+-+-+\n| | | |\n+-+-+-+\n| | | |\n+-+-+-+\n"
      game.make_move(game.current_player, [0,0])
      expect{described_class.print_board(game)}.to output(expected_board).to_stdout
    end
    # muss auf die Textbreite achten -> Board#colum_at
  end
end