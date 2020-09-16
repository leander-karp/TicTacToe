require 'game/board'
require 'game/piece'

RSpec.describe Board do 
  it 'raises an ArgumentError if the size is 0' do 
    expect {described_class.new}.to raise_error(ArgumentError)
  end 

  describe '#full?' do 
    subject(:board) {described_class.new(2,2)}
    let(:piece) {Piece.new('X')}

    it 'equals only true if the board is full' do
      expect(board.full?).to eq false
      board.add(piece, [0,0])
      expect(board.full?).to eq false
      board.add(piece, [0,1])
      expect(board.full?).to eq false
      board.add(piece, [1,0])
      expect(board.full?).to eq false
      board.add(piece, [1,1])
      expect(board.full?).to eq true
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
      expect(board.item_at(0,0)).to eq piece_X
      expect(board.item_at(1,1)).to eq piece_O
    end 

    it 'disfullows to add two pieces at the same place' do 
      expect(board.add(piece_X, [0,0])).to eq true 
      expect(board.add(piece_O, [0,0])).to eq false 
      expect(board.item_at(0,0)).to eq piece_X
    end 
  end

  describe '#rows' do 
    it 'returns length for multiple row boards' do 
      expect(described_class.new(1, 1).rows).to eq 1
      expect(described_class.new(2, 1).rows).to eq 2

    end
  end 

  describe '#columns' do 
    it 'returns length for multiple column boards' do 
      expect(described_class.new(1, 1).columns).to eq 1
      expect(described_class.new(1, 2).columns).to eq 2
    end
  end

  describe '#row_equal?' do 
    subject(:board) {described_class.new(3,3)}
    subject(:piece_X) {Piece.new('X')}

    it 'equals false if nil is present' do 
      expect(board.row_equal?(0)).to eq false 
    end 

    it 'equals true if all elements in a row are equal' do 
      board.add(piece_X, [0,0])
      board.add(piece_X, [0,1])
      board.add(piece_X, [0,2])
      expect(board.row_equal?(0)).to be true
    end 

    it 'equals false if one element is missing' do 
      board.add(piece_X, [0,0])
      board.add(piece_X, [0,2])
      expect(board.row_equal?(0)).to be false
    end 


  end 

  describe '#column_equal?' do 
    subject(:piece_X) {Piece.new('X')}
    subject(:board) do 
      new_board = described_class.new(3,3) 
      new_board.add(piece_X, [0, 0])
      new_board.add(piece_X, [1, 0])
      new_board.add(piece_X, [2, 0])
      new_board.add(piece_X, [1, 1])
      new_board
    end

    it 'equals false if the column is empty' do 
      expect(board.column_equal?(2)).to eq false
    end 

    it 'equals nil if the column_index is greater than #columns' do 
      expect(board.column_equal?(3)).to eq nil
    end 

    it 'equals true if all row elements are equal and not nil' do 
      expect(board.column_equal?(0)).to eq true
    end 
  end 

  describe '#diagonal_equal?' do 
    subject(:piece_X) {Piece.new('X')}
    subject(:board) do 
      new_board = described_class.new(3,3) 
      new_board.add(piece_X, [0, 0])
      new_board.add(piece_X, [1, 1])
      new_board.add(piece_X, [2, 2])
      new_board
    end

    it 'equals false if nil is present in a diagonal' do 
      expect(board.diagonal_equal?(2, 0, -1)).to eq false
      
    end 

    it 'equals true if all diagonal elements are equal' do 
      expect(board.diagonal_equal?(0, 0, 1)).to eq true
    end 
  end 
end 