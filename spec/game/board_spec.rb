require 'game/board'
require 'game/piece'

RSpec.describe Board do 
  it 'raises an ArgumentError if the size is 0' do 
    expect {described_class.new}.to raise_error(ArgumentError)
  end 

  describe '#is_full?' do 
    subject(:board) {described_class.new(2,2)}
    let(:piece) {Piece.new('X')}

    it 'equals only true if the board is full' do
      expect(board.is_full?).to eq false
      board.add(piece, [0,0])
      expect(board.is_full?).to eq false
      board.add(piece, [0,1])
      expect(board.is_full?).to eq false
      board.add(piece, [1,0])
      expect(board.is_full?).to eq false
      board.add(piece, [1,1])
      expect(board.is_full?).to eq true
    end
  end 

  context 'board modification' do 
    subject(:board) {described_class.new(3, 3)}
    let(:piece_X) do 
      Piece.new('X')
    end 
    let(:piece_O) do 
      Piece.new('O')
    end 

    it 'adds multiple pieces at a valid positions' do 
      expect(board.add(piece_X, [0,0])).to eq true
      expect(board.add(piece_O, [1,1])).to eq true
      expect(board.get(0,0)).to eq piece_X
      expect(board.get(1,1)).to eq piece_O
    end 

    it 'disallows to add two pieces at the same place' do 
      expect(board.add(piece_X, [0,0])).to eq true 
      expect(board.add(piece_O, [0,0])).to eq false 
      expect(board.get(0,0)).to eq piece_X
    end 
  end

  describe '#number_of_rows' do 
    it 'returns length for multiple row boards' do 
      expect(described_class.new(1, 1).number_of_rows).to eq 1
      expect(described_class.new(2, 1).number_of_rows).to eq 2

    end
  end 

  describe '#number_of_colums' do 
    it 'returns length for multiple column boards' do 
      expect(described_class.new(1, 1).number_of_colums).to eq 1
      expect(described_class.new(1, 2).number_of_colums).to eq 2
    end
  end
end 