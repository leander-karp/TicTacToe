require 'game/player'
require 'game/piece'

RSpec.describe Player do 
  subject(:playerA) {described_class.new(nameA, iconA)}
  subject(:playerB) {described_class.new(nameB, iconB)}

  let(:nameA) {'Max'} 
  let(:iconA) {'O'}
  let(:nameB) {'Moritz'}
  let(:iconB) {'X'}

  context 'when constructed' do
    it 'has a name equal to the given one' do 
      expect(playerA.name).to eq 'Max'
      expect(playerB.name).to eq 'Moritz'
    end

    it 'has an icon equal to the given one' do 
      expect(playerA.icon).to eq 'O'
      expect(playerB.icon).to eq 'X'
    end
  end

  describe '#owns_piece?' do 
    let(:pieceX) {Piece.new('X')}
    let(:pieceO) {Piece.new('O')}

    it 'equals true if the piece has the players icon' do 
      expect(playerA.owns_piece?(pieceO)).to eq true
    end 
    it 'equals false if the piece has the other players icon' do 
      expect(playerA.owns_piece?(pieceX)).to eq false
    end
  end 

end 
