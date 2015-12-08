#!/usr/bin/env ruby

class Node
  attr_accessor :left
  attr_accessor :right
  attr_accessor :up
  attr_accessor :down

  attr_accessor :times_visited

  def initialize
    @times_visited = 0
  end
end

up = '^'
down = 'v'
left = '<'
right = '>'

input_file = File.open('input2.txt')

start = Node.new
start.times_visited += 1
current = start

new_houses_visted = 1
houses_visted = 1

input_file.each_char do |c|
  case c
  when up
    if current.up
      puts "up"
      next_node = current.up
    else
      puts "new up"
      next_node = Node.new
      next_node.down = current
      current.up = next_node
    end
  when down
    if current.down
      puts "down"
      next_node = current.down
    else
      puts "new down"
      next_node = Node.new
      next_node.up = current
      current.down = next_node
    end
  when left
    if current.left
      puts "left"
      next_node = current.left
    else
      puts "new left"
      next_node = Node.new
      next_node.right = current
      current.left = next_node
    end
  when right
    if current.right
      puts "left"
      next_node = current.right
    else
      puts "new right"
      next_node = Node.new
      next_node.left = current
      current.right = next_node
    end
  else
    next
  end

  if next_node.times_visited == 0
    new_houses_visted += 1
  end

  next_node.times_visited += 1
  houses_visted += 1
  puts houses_visted
  current = next_node
end

input_file.close

puts "New houses visited: #{new_houses_visted}"
puts "Houses visited: #{houses_visted}"
