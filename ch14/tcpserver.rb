require 'socket'

# s = TCPServer.new(3939)
# conn = s.accept
# conn.puts "Hi. Here's the date."
# conn.puts `date`
# conn.close
# s.close

# s = TCPServer.new(3939)
# while true
#   conn = s.accept
#   conn.puts "Hi. Here's the date"
#   conn.puts `date`
#   conn.close
# end

# s = TCPServer.new(3939)
# while true
#   conn = s.accept
#   conn.print "Hi. What's your name: "
#   name = conn.gets.chomp
#   conn.puts "Hi, #{name}. Here's the date"
#   conn.puts `date`
#   conn.close
# end

# s = TCPServer.new(3939)
# while (conn = s.accept)
#   Thread.new(conn) do |c|
#     c.print "Hi. What's your name: "
#     name = c.gets.chomp
#     c.puts "Hi, #{name}. Here's the date: "
#     c.puts `date`
#     c.close
#   end
# end

def welcome(chatter)
  chatter.print "Welcome! Please enter your name: "
  chatter.readline.chomp
end
def broadcast(message, chatters)
  chatters.each do |chatter|
    chatter.puts message
  end
end
s = TCPServer.new(3939)
  chatters = []
while (chatter = s.accept)
  Thread.new(chatter) do |c|
    name = welcome(chatter)
    broadcast("#{name} has joined", chatters)
    chatters << chatter
    begin
      loop do
        line = c.readline
        broadcast("#{name}: #{line}", chatters)
      end
    rescue EOFError
      c.close
      chatters.delete(c)
      broadcast("#{name} has left", chatters)
    end
  end
end
