
class Board
  def initialize(rows=0, columns=0)
    if rows <= 0 || columns <= 0
      raise ArgumentError.new 'Invalid board size provided.'
    else
      @board = Array.new(rows) {Array.new(columns)}
      @rows = rows
      @columns = columns
    end
  end

  def add(piece, position)
    row_index = position[0]
    column_index = position[1]
    if valid_position?(row_index, column_index) && get(row_index, column_index).nil?
      @board[row_index][column_index] = piece
      true
    else 
      false 
    end
  end

  def all?
    @board.flatten.all?
  end

  def get(row_index, column_index)
    if valid_position?(row_index, column_index)
      @board[row_index][column_index]
    end
  end

  def number_of_rows
    @rows
  end

  def number_of_colums
    @columns
  end

  private 
  def valid_position?(row_index, column_index)
    row_index < @rows && column_index < @columns
  end
end