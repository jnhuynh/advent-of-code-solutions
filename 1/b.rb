#!/usr/bin/env ruby

up = '('
down = ')'

floor = 0
char_pos = 0
basement_char_pos = nil

input_file = File.open('input.txt')
input_file.each_char do |c|
  char_pos += 1

  case c
  when up
    floor += 1
  when down
    floor -= 1
  else
    next
  end

  if !basement_char_pos && floor == -1
    basement_char_pos = char_pos
  end
end
input_file.close

puts "Santa ends on floor: #{floor}"
puts "Santa enters the basement on character position: #{basement_char_pos}"
