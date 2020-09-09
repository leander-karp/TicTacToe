require 'renderer'
require 'tictactoe'
require 'game/player'
require 'game/piece'

RSpec.describe Renderer do 
  let(:playerA) {Player.new('Max', 'O')}
  let(:playerB) {Player.new('Moritz', 'X')}

  let(:game) {TicTacToe.new(playerA, playerB)}
  let(:renderer) {described_class.new}

  describe '#input' do
    it 'addresses the current player' do 
      msg = game.current_player.name + " enter your next move:\n"

      expect{renderer.input(game)}.to output(msg).to_stdout
    end 

    

  end 
end