#!/usr/bin/ruby
ft_needed = 0

input_file = File.open('input.txt')
input_file.each_line do |line|
  dimensions = line.strip.split('x')
  width = dimensions[0].to_i
  height = dimensions[1].to_i
  length = dimensions[2].to_i

  wl = 2 * (width + length)
  wh = 2 * (width + height)
  hl = 2 * (height + length)

  perimeter = wl
  perimeter = perimeter > wh ? wh : perimeter
  perimeter = perimeter > hl ? hl : perimeter

  ft_needed += perimeter
  ft_needed += width * height * length
end
input_file.close

puts "Footage needed: #{ft_needed}"
