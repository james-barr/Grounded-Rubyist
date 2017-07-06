p eval("2+2")

print "Please Type Method Name (do not capitalize): "
m = gets.chomp
eval("def #{m}; puts 'Hi!'; end")
puts "-----"
eval(m)

def use_a_binding(b)
  eval("puts str", b)
end
str = "I'm a string in top-level binding"
use_a_binding(binding)

p self
a = []
a.instance_eval {p self}

class C
  def initialize
    @x = 1
  end
end

c = C.new
c.instance_eval { puts @x }

string = "A sample string"
p string.instance_exec("s") {|delim| self.split(delim)}

class Person
  def initialize(&block)
    instance_eval(&block)
  end

  def name(name=nil)
    @name ||= name
  end

  def age(age=nil)
    @age ||= age
  end
end

david = Person.new do
  name "David"
  age 55
end

c = Class.new
c.class_eval do
  def some_method
    puts "Created in class_eval"
  end
end

c_instance = c.new
c_instance.some_method

var = "initialized variable"
class C
  # puts var
end

C.class_eval { puts var }
C.class_eval { def talk; puts var; end }
# C.new.talk
puts "---"
# C.new.talk
C.class_eval { define_method("talk") {puts var }}
C.new.talk
