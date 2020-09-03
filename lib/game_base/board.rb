
class Board
  def initialize(rows=0, columns=0)
    @board = []

    if rows > 0 && columns > 0
      @board = Array.new(rows) {Array.new(columns)}
    end
  end

  def add(piece, position)
    row_index = position[0]
    column_index = position[1]
    if valid_position?(row_index, column_index)
      @board[row_index][column_index] = piece
      true
    else 
      false 
    end
  end

  def get(row_index, column_index)
    if valid_position?(row_index, column_index)
      @board[row_index][column_index]
    end
  end

  def remove(row_index, column_index)
    old_piece = get(row_index, column_index)
    add(nil, [row_index, column_index])
    old_piece
  end

  def number_of_rows
    @board.length
  end

  def number_of_colums
    number_of_rows > 0? @board[0].length : 0
  end

  protected 
  def valid_position?(row_index, column_index)
    row_index < @board.length && column_index < @board[row_index].length
  end
end