class C
  def talk
    puts "Method-grabbing test! self is #{self}"
  end
end

c = C.new
meth = c.method(:talk)
puts meth
meth.call

class D < C
end

d = D.new
unbound = meth.unbind
unbound.bind(d).call

dd = D.new
unbound = C.instance_method(:talk)
unbound.bind(dd).call

class X
  def a_method
    puts "Definition in class X"
  end
end

class Y < X
  def a_method
    puts "Definition in class Y (subclass of X)"
  end
end

class Z < Y
end

z = Z.new
z.a_method
X.instance_method(:a_method).bind(z).call

class Z
  def call_original
    X.instance_method(:a_method).bind(self).call
  end
end

z.call_original

mult = lambda {|x,y| x * y}
twelve = mult[3,4]
puts twelve
ten = mult.(2,5)
puts ten
