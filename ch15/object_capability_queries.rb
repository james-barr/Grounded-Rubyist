string = "Test String"
p string.methods.grep(/case/).sort
p string.methods.grep(/.!/).sort

def string.surprise!; end

methods = string.methods
bangs = methods.grep(/.!/)
unmatched = bangs.reject do |b|
  methods.include?(b[0..-2].to_sym)
end
if unmatched.empty?
  puts "All bang methods are matched by non-bang methods"

else
  puts "Some bang methods have no non-bang partner: "
  p unmatched
end

class C; end
p C.methods.sort

o = Object.new; p o.private_methods.size
o = Object.new; p o.protected_methods.size

o = Object.new; p o.private_methods - BasicObject.private_instance_methods(false) - Kernel.private_instance_methods(false)

class Person
  attr_reader :name
  def name=(name)
    @name = name
    normalize_name
  end
  private
  def normalize_name
    name.gsub!(/[^-a-z'.\s]/i, "")
  end
end
david = Person.new
david.name = "123David!! Bl%ack"
raise "Problem" unless david.name = "David Black"
puts "Name has been normalized"
puts david.name
p david.private_methods.sort.grep(/normal/)

p String.methods.grep(/methods/).sort
p Range.instance_methods(false).sort

p Range.instance_methods(false) & Enumerable.instance_methods(false)

puts
puts "**********"
puts

overrides = {}
enum_classes = ObjectSpace.each_object(Class).select do |c|
  c.ancestors.include?(Enumerable)
end


puts
puts "**********"
puts

class C
end
c = C.new
class << c
  def x
  end
  def y
  end
  def z
  end

  protected :y
  private :z
  p private_instance_methods(false)
end
p c.singleton_methods.sort


class G; end
class H < G; end
def G.a_class_method_on_g; end
def H.a_class_method_on_h; end
p H.singleton_methods

p File.singleton_methods - File.singleton_methods(false)
p IO.singleton_methods(false)
