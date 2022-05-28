#!/usr/bin/env ruby

puts("Open file and print contents")
filename = "file_dir_test.txt"
if (File.file?(filename))
   IO.foreach(filename,"r") do |x|
      puts x
   end
else
   puts("Coud not find file $#{filename}")
end

puts("List files in dir.")
files = Dir['./*'].select { |path| File.file?(path) }
puts files
