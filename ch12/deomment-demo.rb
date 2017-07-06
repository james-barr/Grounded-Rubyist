require 'stringio'
require_relative 'decommenter'

string = <<EOM

# This is a comment.
This isn't a comment.
# This is.
# So is this.
This is also not a comment.
EOM

infile = StringIO.new(string)
outfile = StringIO.new("")

x = <<EOM
This isn't a comment.
This is also not a comment.
EOM

DeCommenter.decomment(infile,outfile)

puts "Test succeeded" if outfile.string == x
