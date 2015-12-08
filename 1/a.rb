#!/usr/bin/env ruby

up = '('
down = ')'

floor = 0

input_file = File.open('input.txt')
input_file.each_char do |c|
  case c
  when up
    floor += 1
  when down
    floor -= 1
  else
    next
  end
end
input_file.close

puts "Santa ends on floor: #{floor}"
