
class Board
  attr_reader :rows, :columns

  def initialize(rows=0, columns=0)
    raise ArgumentError.new 'Invalid board size provided.' if rows < 1 || columns < 1
    
    @board    = Array.new(rows) {Array.new(columns)}
    @rows     = rows
    @columns  = columns
  end

  def add(piece, position)
    row_index     = position[0]
    column_index  = position[1]
    if valid_position?(row_index, column_index) && item_at(row_index, column_index).nil?
      @board[row_index][column_index] = piece
      true
    else 
      false 
    end
  end

  def full?
    @board.flatten.all?
  end

  def row_equal_piece(row_index)
    equal_piece(@board[row_index])
  end

  def column_equal_piece(column_index) 
    if column_index < columns
      column = @board.reduce([]) do |accumulator, column_array|
        accumulator.push(column_array[column_index]) 
        accumulator
      end 
      equal_piece(column)
    end
  end 

  def diagonal_equal_piece(row_index, column_index, row_acc, column_acc)
    pieces = []
    while valid_position?(row_index, column_index)
      pieces.push(item_at(row_index, column_index))
      row_index += row_acc
      column_index += column_acc
    end 
    equal_piece(pieces)
  end 

  def item_at(row_index, column_index)
    if valid_position?(row_index, column_index)
      @board[row_index][column_index]
    end
  end

  private 
  def valid_position?(row_index, column_index)
    (0...rows).include?(row_index) && (0...columns).include?(column_index)
  end

  def equal_piece(array)
    array.reduce(array.first) do |acc, item|
      acc if acc == item 
    end 
  end
end