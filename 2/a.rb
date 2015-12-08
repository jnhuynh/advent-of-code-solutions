#!/usr/bin/ruby
sq_ft_needed = 0

input_file = File.open('input.txt')
input_file.each_line do |line|
  dimensions = line.strip.split('x')
  width = dimensions[0].to_i
  height = dimensions[1].to_i
  length = dimensions[2].to_i

  # puts "#{width}W x #{height}H x #{length}L"

  wl = width * length
  wh = width * height
  hl = height * length

  slack = wl
  slack = slack > wh ? wh : slack
  slack = slack > hl ? hl : slack

  # puts "#{slack} + 2 * (#{wl} vs #{wh} vs #{hl})"

  sq_ft_needed += 2 * wl
  sq_ft_needed += 2 * wh
  sq_ft_needed += 2 * hl
  sq_ft_needed += slack
end
input_file.close

puts "Square footage needed: #{sq_ft_needed}"
