fh = File.open("display.tmp", "w")
"Hello mothertrucker!".display(fh)

fh.close

puts(File.read("display.tmp"))
