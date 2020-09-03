class Piece 
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def == (other)
    other.instance_of?(Piece) && other.value == value
  end
end