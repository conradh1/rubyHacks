#!/bin/ruby

values = Array[1, 2, 3, 4, 5, 6, 7 , 8, 9]


#loop through using index

values.each_index do |i|
    print"#{values[i]}"
end
puts

puts"length of array #{values.length}"
puts"first value #{values.first}. Last value: #{values.last}"
puts"take 3 elements array.take(3): #{values.take(3)}"
puts"reverse #{values.reverse}"
puts"join with pipe: #{values.join('|')}"
puts"includes 3 #{values.include?(3)} include 10 #{values.include?(10)}"

puts" select n < 5 #{values.select{ |n| n < 5}}"
# also push, pop, delete at, concat, slecet
