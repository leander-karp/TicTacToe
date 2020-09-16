
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

  def row_equal?(row_index)
    row = @board[row_index]
    row.uniq.size == 1 && !row.include?(nil) unless row_index >= rows
  end

  def column_equal?(column_index) 
    if column_index < columns
      column = @board.reduce([]) do |accumulator, column_array|
        accumulator.push(column_array[column_index]) 
        accumulator
      end 
      column.uniq.size == 1 && !column.include?(nil) 
    end
  end 

  def diagonal_equal?(row_index, column_index, modifier)
    pieces = []
    while valid_position?(row_index, column_index)
      pieces.push(item_at(row_index, column_index))
      row_index += modifier
      column_index += modifier
    end 
    pieces.uniq.size == 1 && !pieces.include?(nil) 
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
end