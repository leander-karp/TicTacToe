require 'game_base/piece'

RSpec.describe Piece do 
  subject(:piece) {described_class.new(icon)}

  context 'has an icon value' do 
    let(:icon) do 
      'O'
    end 

    it '' do 
      expect(piece.value).to eq 'O'
    end 
  end 

  context 'can compare itself' do 
    let(:icon) do 
      'O'
    end 

    it 'equals to another Piece with the same value' do 
      expect(piece == Piece.new('O')).to be true
    end 

    it 'does not equal to a piece with a different value' do 
      expect(piece == Piece.new('X')).to be false
    end

    it 'does only equals to other pieces' do 
      expect(piece == 'a different object').to be false 
    end
  end 
end 