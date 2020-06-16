# The struct way
SelectOptionStruct = Struct.new(:display, :value) do
  def to_ary
    [display, value]
  end
end

# The class way
class SelectOption
  attr_accessor :display, :value

  def initialize(display, value)
    @display = display
    @value = value
  end

  def to_ary
    [display, value]
  end
end

class_way = SelectOption.new(1, 2)
print "#{class_way.to_ary} \n"

struct = SelectOptionStruct.new('Tien Do', 31)
print struct.display + "\n"
puts struct.value
print struct.to_ary
