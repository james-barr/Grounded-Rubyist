class C
  def talk
    puts "hi"
  end
end

c = C.new
c.talk

obj = Object.new

def obj.talk
  puts "hi"
end
obj.talk

class Car
  def self.makes
    %w{ Honda Ford Toyota Chevrolet Volvo }
  end
end

puts Car.makes

# def 10.some_method; end
# class << 10; end

str = "I am a string"

class << str
  def twice
    self + " " + self
  end
end

puts str.twice

N = 1
obj = Object.new
class << obj
  N = 2
end

def obj.a_method
  puts N
end

class << obj
  def another_method
    puts N
  end
end

obj.a_method
obj.another_method

class Ticket
  class << self
    def most_expensive(*tickets)
      tickets.max_by(&:price)
    end
  end
end

class Person
  attr_accessor :name
end

david = Person.new
david.name = "David"
matz = Person.new
matz.name = "Matz"
ruby = Person.new
ruby.name = "Ruby"

def david.name
  "[not available]"
end

puts "We've got one person named #{matz.name}, "
puts "one named #{david.name},"
puts "and one named #{ruby.name}."

module Secretive
  def name
    "[not available]"
  end
end

class << ruby
  include Secretive
end

puts "We've got one person named #{matz.name}, "
puts "one named #{david.name},"
puts "and one named #{ruby.name}."

class C
  def talk
    puts "Hi from original class"
  end
end

module M
  def talk
    puts "Hello from mpdule!"
  end
end

c = C.new
c.talk
class << c
  include M
  p ancestors
end
c.talk

class C
  include M
end
class << c
  p ancestors
end

string = "a string"
p string.singleton_class.ancestors

class C
end

def C.a_class_method
  puts "Singleton method defined on C"
end
C.a_class_method

class D < C
end
D.a_class_method
