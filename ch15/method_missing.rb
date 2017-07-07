class Cookbook
  attr_accessor :title, :author
  def initialize
    @recipes = []
  end
  def method_missing(m,*args,&block)
    @recipes.push(m,*args,&block)
  end
end

class Recipe
end

recipe_for_cake = Recipe.new
recipe_for_chicken = Recipe.new

cb = Cookbook.new

cb << recipe_for_cake
cb << recipe_for_chicken

# beef_dishes = cb.select {|recipes| recipe.main_ingredient == "beef"}


p cb.recipes

# def method_missing(m,*args,&block)
#   raise NameError, "What on earth do you mean #{m}?"
# end

# a

# BasicObject.new.a

# a?

class Person
  attr_accessor :name, :age
  def initialize(name, age)
    @name, @age = name, age
  end

  def method_missing(m, *args, &block)
    if /set_(.*)/.match(m)
      self.send("#{$1}=", *args)
    else
      super
    end
  end

  def respond_to_missing?(m, include_private = false)
    /set_/.match(m) || super
  end

end

person = Person.new("David", 54)
person.set_age(55)
p person.age
p person.respond_to?(:set_age)

module M
  def self.included(c)
    puts "I have just been mixed into #{c}"
  end
end

class C
  include M
end

module N
  def self.included(c1)
    def c1.a_class_method
      puts "now the class has a new class method"
    end
  end
  def an_inst_method
    puts "this module supplies this instance method"
  end
end

class D
  include N
end

d = D.new
d.an_inst_method
D.a_class_method

module O
  def self.extended(obj)
    puts "Module #{self} is being used by #{obj}"
  end
  def an_inst_method
    puts "This module supplies this instance method"
  end
end

my_object = Object.new
my_object.extend(O)
my_object.an_inst_method

module P
  def self.included(c)
    puts "#{self} included by #{c}"
  end
  def self.extended(obj)
    puts "#{self} extended by #{obj}"
  end
end
obj = Object.new
puts "Including P in object's singleton class: "
class << obj
  include P
end
puts
obj = Object.new
puts "Extending object with P: "
obj.extend(P)

class Q
  def self.inherited(subclass)
    puts "#{self} just got subclassed by #{subclass}."
  end
end
class R < Q
end
class S < R
end
class Q
  class << self
    def self.inherited
      puts "Singleton class of Q just got inherited"
      puts "But you will never see this message"
    end
  end
end
class R < Q
  class << self
    puts "D's singleton class now exists, but no callback"
  end
end

class C
  def self.const_missing(const)
    puts "#{const} is undefined-setting it to 1."
    const_set(const,1)
  end
end
puts C::A
puts C::A


class C
  def self.method_added(m)
    puts "Method #{m} was just added"
  end
  def a_new_method
  end
  def self.singleton_method_added(m)
    puts "Method #{m} was just defined"
  end
  def self.new_class_method
  end
end

obj = Object.new
def obj.singleton_method_added(m)
  puts "Singleton method #{m} was just defined"
end
def obj.a_singleton_method
end

obj = Object.new
class << obj
  def singleton_method_added(m)
    puts "Singleton method #{m} was just defined"
  end
  def a_new_singleton_method
  end
end

class C
  def singleton_method_added(m)
    puts "Singleton method #{m} was just defined"
  end
end
c = C.new
def c.a_singleton_method
end
