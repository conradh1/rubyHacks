#!/usr/bin/env ruby

filename = "file_dir_test.txt"
if (File.file?(filename))
   IO.foreach(filename,"r") |x|
      puts x
   end
else
   puts("Coud not find file $#{filename}")
end
# list files in dir
# open file for reading 
# print contents.