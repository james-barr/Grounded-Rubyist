f = File.open("ticket2.rb")

contents_array = f.readlines
f.rewind
next_line = f.readline
f.rewind
contents = f.read
f.rewind
f.each { |line| puts "Next Line: #{line}" }
f.rewind
next_char = f.getc
second_char = f.readchar

p contents_array
p next_line
p contents
puts "-----"
p next_char
p second_char
puts "the current position is #{f.pos}"
f.seek(20, IO::SEEK_SET)
puts "let's seek forward 20 bytes from the start.
the current position is #{f.pos}"
f.seek(15, IO::SEEK_CUR)
puts "Let's seek foward 15 bytes from our current position.
the new position is #{f.pos}"
f.seek(20, IO::SEEK_END)
puts "Let's set the position to 20 from the end.
the new position is #{f.pos}"
f.pos = 55
puts "Let's set the position to 55.
the new position is #{f.pos}"
