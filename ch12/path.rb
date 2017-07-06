require 'pathname'

path = Pathname.new("/home/james/gd/workspace/ruby/ground/ch12/baker.rb")
p path

p path.basename
puts path.basename

puts path.dirname

puts path.extname

path.ascend do |dir|
  puts "next level up #{dir}"
end

path.ascend do |dir|
  puts "ascended to #{dir.basename}"
end
