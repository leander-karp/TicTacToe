
class Player
  attr_reader :name, :icon
  def initialize(name, icon)
    @name = name 
    @icon = icon
  end

  def owns_piece?(piece)
    piece.value == icon
  end
end