#additive changes
require 'rubygems'
require 'active_support'
require 'active_support/core_ext/object'
require 'active_support/inflector'

p "person".pluralize
p "little_dorritt".titleize

# pass-through overrides

class String
  alias __old_reverse__ reverse
  def reverse
    $stderr.puts "Reversing a string"
    __old_reverse__
  end
end
puts "David".reverse

#additive / pass-through hybrids

p Time.now.to_s
p Time.now.to_s(:db)
p Time.now.to_s(:number)
p Time.now.to_s(:rfc822)

#per object
module Secretive
  def name
    "[not available]"
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

david.extend(Secretive)
ruby.extend(Secretive)

puts "We've got one person named #{matz.name}, " +
      "one named #{david.name}, " +
      "and one named #{ruby.name}"

class Car
  def self.makes
    %w{ Honda Ford Toyota Chevy Volvo }
  end
end

module Makers
  def makes
    %w{ Hona Ford Toyota Chevy Volvo }
  end
end

class Car
  extend Makers
end

p Car.singleton_class.ancestors

module GsubBangModifier
  def gsub!(*args, &block)
    super || self
  end
end

str = "Hello there"
str.extend(GsubBangModifier)
str.gsub!(/zzz/, "abc").reverse!
puts str


# refinements

module Shout
  refine String do
    def shout
      self.upcase + "!!!"
    end
  end
end

class Person
  attr_accessor :name

  using Shout
  def announce
    puts "Announcing #{name.shout}"
  end
end

david = Person.new
david.name = "David"
david.announce

# BasicObject

# p BasicObject.new.methods.sort
p BasicObject.instance_methods(false).sort

require 'builder'
xml = Builder::XmlMarkup.new(:target => STDOUT, :indent => 2)
xml.instruct!
xml.friends do
  xml.friend(:source => "college") do
    xml.name("Joe Smith")
    xml.address do
      xml.street("123 Main Street")
      xml.city("Anywhere, USA 00000")
    end
  end
end

class Lister < BasicObject
  attr_reader :list
  def initialize
    @list = ""
    @level = 0
  end
  def indent(string)
    " " * @level + string.to_s
  end
  def method_missing(m, &block)
    @list << indent(m) + ":"
    @list << "\n"
    @level += 2
    @list << indent(yield(self)) if block
    @level -= 2
    @list << "\n"
    return ""
  end
end

lister = Lister.new
lister.groceries do |item|
  item.name { "Apples" }
  item.quantity { 10 }
  item.name { "Sugar" }
  item.quantity { "1 lb" }
end
lister.freeze do |f|
  f.name { "Ice Cream" }
end
lister.inspect do |i|
  i.item { "car" }
end
lister.sleep do |s|
  s.hours { 8 }
end
lister.print do |document|
  document.book { "Chapter 13" }
  document.letter { "to editor" }
end
puts lister.list
