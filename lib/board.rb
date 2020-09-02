
class Board
  def self.create(rows, columns)
    column_length = columns.nil? || columns < 1? 1: columns
    row_length = rows.nil? || rows < 1? 1: rows
    Array.new(row_length, Array.new(column_length) {Field.new} )
  end
end