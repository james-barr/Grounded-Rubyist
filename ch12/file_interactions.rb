f = File.new("data.out", "w")
f.puts "James Barr, Rubyist"
f.close
puts File.read("data.out")
f = File.new("data.out", "a")
f.puts "Yukihiro Matsumote, Ruby Creator"
f.close
puts File.read("data.out")

File.open("records.txt") do |file|
  while record = file.gets
    name, nationality, instrument, dates = record.chomp.split('|')
    puts "#{name} (#{dates}), who was #{nationality},
    played #{instrument}"
  end
end

File.open("records.txt") do |f|
  f.each do |record|
    name, nationality, instrument, dates = record.chomp.split('|')
    puts "#{name} (#{dates}), who was #{nationality},
    played #{instrument}"
  end
end

count = 0
total_ages = File.readlines("members.txt").inject(0) do |total, line|
  count += 1
  fields = line.split
  age = fields[3].to_i
  total + age
end
puts "Avg age of group: #{total_ages / count}"

count = 0
total_ages = File.open("members.txt") do |f|
  f.inject(0) do |total, line|
    count += 1
    fields = line.split
    age = fields[3].to_i
    total + age
  end
end
puts "Avg age of group: #{total_ages / count}"

puts File.size("members.txt")
puts FileTest.size("members.txt")
puts File::Stat.new("members.txt").size
puts FileTest.exist?("members.txt")
puts FileTest.directory?("members.txt")
puts FileTest.file?("members.txt")
puts FileTest.symlink?("members.txt")
puts FileTest.readable?("members.txt")
puts FileTest.writable?("members.txt")
puts FileTest.executable?("members.txt")
puts FileTest.zero?("members.txt")
puts File::Stat.new("members.txt")
File.open("members.txt") {|f| p f.stat}

d = Dir.new("/home/james/gd/workspace/ruby/ground/ch12")
p d.entries
p Dir.entries("/home/james/gd/workspace/ruby/ground/ch12")
entries = d.entries
entries.delete_if { |entry| entry =~ /^\./ }
entries.map! { |entry| File.join(d.path, entry) }
entries.delete_if { |entry| !File.file?(entry) }
print "Total bytes: "
puts entries.inject(0) { |total, entry| total + File.size(entry) }

dir_glob = Dir["/home/james/gd/workspace/ruby/ground/ch12/r*.rb"]
p dir_glob

direct = "/home/james/gd/workspace/ruby/ground/ch12"
ents = Dir["#{direct}/*"].select {|entry| File.file?(entry)}
print "Total btyes: "
puts ents.inject(0) {|total, entry| total + File.size(entry)}

# File.open("no_such_file")
# File.open("/var/root")
# f = File.open("/tmp")
# f.gets
