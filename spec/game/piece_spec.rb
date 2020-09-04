require 'game_base/piece'

RSpec.describe Piece do 
  subject(:piece) {described_class.new(icon)}

  context 'when there is an icon value' do 
    let(:icon) do 
      'O'
    end 

    it 'equals to the given argument' do 
      expect(piece.value).to eq 'O'
    end 
  end 

  context 'can compare itself' do 
    let(:icon) do 
      'O'
    end 

    it 'equals to another Piece with the same value' do 
      expect(piece).to eq(Piece.new('O'))
    end 

    it 'does not equal to a piece with a different value' do 
      #expect(piece == Piece.new('X')).to be false
      expect(piece).not_to eq(Piece.new('X'))
    end
  end 
end 