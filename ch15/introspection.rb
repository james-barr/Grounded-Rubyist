x = 1
p local_variables
p global_variables.sort

class Person
  attr_accessor :name, :age
  def initialize(name)
    @name = name
  end
end
david = Person.new("David")
p david.instance_variables
david.age = 55
p david.instance_variables
#
class Z
  def x
    y
  end
  def y
    z
  end
  def z
    p caller
  end
end
z = Z.new
z.x

# class Z
#   def x
#     y
#   end
#   def y
#     z
#   end
#   def z
#     raise
#   end
# end
# z = Z.new
# z.x

puts
puts "******"
puts

require_relative 'callertools'

class AA
  def x
    y
  end
  def y
    z
  end
  def z
    stack = CallerTools::Stack.new
    puts stack.report
  end
end
aa = AA.new
aa.x
puts "x"
