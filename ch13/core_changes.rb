string = "A test string"
re = /A (sample) string/
# p substring = re.match(string)[1]

class Regexp
  alias __old_match__ match
  def match(string)
    __old_match__(string) || []
  end
end

substring = re.match(string)[1]
p substring
p /abc/.match("X")

if /abc/.match("1")
  puts "unexpected"
else
  puts "expected"
end

string = "Hello there"
p string.gsub!(/e/, "E")
puts string
string = "Hello there"
p string.gsub!(/zzz/, "xxx")
puts string
string = "Hello there"
p string.gsub!(/e/, "E").reverse!
string = "Hello there"
# p string.gsub!(/zzz/, "xxx").reverse!

p "Hello".tap { |string| puts string.upcase }.reverse

string = "Hello there!"
p string.gsub!(/zzz/, "xxx")
p string.reverse!

class String
  alias __old_gsub_bang__ gsub!
  def gsub!(*args, &block)
    __old_gsub_bang__(*args, &block)
    self
  end
end

states = {"NY"=>"New York", "NJ"=>"New Jersey", "ME"=>"Maine"}
string = "Eastern states include NY, NJ, and ME."
if string.gsub!(/\b([A-Z]{2})\b/) { states[$1] }
  puts "Substitution occurred"
  puts string
else
  puts "string unchanged"
end

string = "Eastern states include NY, NJ, and ME."
while string.sub!(/\b([A-Z]{2})\b/) {states[$1]}
  puts "replacing #{$1} with #{states[$1]}..."
end
