
class Field
  attr_accessor :state

  def initialize(field_state=nil)
    @state = field_state
  end

  def empty?
    state.nil? 
  end

  def clear
    @state = nil 
  end

  def == (other)
    other.instance_of?(Field)? other.state == @state : false
  end
end