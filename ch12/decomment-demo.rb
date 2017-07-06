require 'stringio'
require_relative 'decommenter'
string = <<EOM
# This is a comment
This is not a comment
# This is
  # So is this
This is not
EOM
infile = StringIO.new(string)
outfile = StringIO.new("")
DeCommenter.decomment(infile,outfile)
puts "Test succeeded" if outfile.string == <<EOM
This isn't a comment
This is also not a comment
EOM
