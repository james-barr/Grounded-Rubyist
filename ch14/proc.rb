pr = Proc.new { puts "Inside a proc's block" }
pr.call

[1,2,3].each {|x| puts x * 10 }

def call_a_proc(&block)
  block.call
end

call_a_proc { puts "Im the block.. or proc.. or something"}

pr = Proc.new {|x| p x.upcase}

%w[ David Black ].each(&p)

def capture_block(&block)
  block.call
end

capture_block { puts "Inside the block" }

# capture_block(&p) { puts "This is the explicit block"}
# capture_block(p.to_proc)

class Person
  attr_accessor :name

  def self.to_proc
    Proc.new {|person| person.name}
  end
end

d = Person.new
d.name = "David"
m = Person.new
m.name = "Matz"
p [d,m].map(&Person)

p %w{ david black}.map(&:capitalize)
p %w[ david black].map &:capitalize

# class Symbol
#   def to_proc
#     Proc.new {|obj| obj.send(self)}
#   end
# end

class Symbol
  def to_proc
    puts "In the new Symbol#to_proc!"
    Proc.new {|obj| obj.send(self)}
  end
end

p %w{ david black }.map(&:capitalize)
m = 10
[1,2,3].each {|x| puts x * m}

def multiply_by(m)
  Proc.new {|x| puts x * m}
end

mult = multiply_by(10)
mult.call(12)

def call_some_proc(pr)
  a = "irrelevant 'a' in method scope"
  puts a
  pr.call
end

a = "'a' to be used in Proc block"
pr = Proc.new { puts a }
pr.call
call_some_proc(pr)

def make_counter
  n = 0
  return Proc.new { n += 1 }
end

c = make_counter
puts c.call
puts c.call
d = make_counter
puts d.call
puts c.call

pr = Proc.new {|x| puts "called with argument #{x}" }
pr.call(100)

pr = Proc.new {|x| p x}
pr.call
pr.call(1,2,3)

lam = lambda { puts "A lambda!"}
lam.call

def return_test
  l = lambda { return }
  l.call
  puts "still here"
  p = Proc.new { return }
  p.call
  puts "You won't see this message"
end
return_test

# returns a fatal error since it is called outside of a method
# Proc.new { return }.call

lam = lambda {|x| p x}
lam.call(1)
# lam.call # argument error, requires 1 arg
# lam.call(1,2,3) # argument error, requires 1 arg

lam = -> { puts "hi" }

lam.call

mult = -> (x,y) { p x * y }
mult.call(3,4)

lam = lambda { |a, b=1| p "Doesn't work in Ruby 1.8 -- syntax error"}
lam.call("x")
lam = ->(a, b=1) { p "Works in Ruby 1.8"}
lam.call(1)
