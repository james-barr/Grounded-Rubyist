system("date")
puts $?
# system("cat")
# system('grep "D"')

system("datee")
puts $?

puts "***"

system("date")
puts $?
Thread.new { system("datee"); p $?}.join
puts $?

puts "###"

d = `date`
puts d
puts "Next we're going to run the 'cat' command, so please type in some information (can be anything) and press enter (formatting) and then Ctr+D"
output = `cat`
puts output
# `datee`
# $?
`date`
puts $?

puts %x{date}
puts %x(date)
puts %x-date-

command = "date"
puts %x(#{command})


# open
d = open("|cat", "w+")
puts d
d.puts "Hello to cat"
puts d.gets
d.close
puts "***"


open("|cat", "w+") {|p| p.puts("hi"); puts p.gets }

# Open.popen3
puts "===="
require 'open3'
stdin, stdout, stderr = Open3.popen3("cat")
stdin.puts("Hi\nBye")
puts stdout.gets
puts stdout.gets

puts "+++"
# Note this is an infinte loop
stdin, stdout, stderr = Open3.popen3("cat")
t = Thread.new do
  loop { stdin.puts gets } #this creates the infinite loop, must Ctr+C during runtime to exit loop
end
u = Thread.new do
  n = 0
  str = ""
  loop do
    str << stdout.gets
    n += 1
    if n % 3 == 0
      puts "--------\n"
      puts str
      puts "--------\n"
      str = ""
    end
  end
end
t.join
u.join
