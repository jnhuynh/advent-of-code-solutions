#!/usr/bin/env ruby

def find_in_graph(graph, x, y)
  idx = graph.find_index do |n|
    n.x == x && n.y == y
  end

  idx ? graph[idx] : nil
end

class Node
  attr_accessor :left
  attr_accessor :right
  attr_accessor :up
  attr_accessor :down

  attr_accessor :x
  attr_accessor :y

  attr_accessor :times_visited

  def initialize
    @times_visited = 0
    @x = 0
    @y = 0
  end
end

up = '^'
down = 'v'
left = '<'
right = '>'

input_file = File.open('input.txt')

start = Node.new
start.times_visited += 1
current = start

graph = []
graph.push(start)

houses_visited = 1

input_file.each_char do |c|
  x = current.x
  y = current.y
  case c
  when up
    y += 1
  when down
    y -= 1
  when left
    x -= 1
  when right
    x += 1
  else
    next
  end

  next_node = find_in_graph(graph, x, y)

  if !next_node
    next_node = Node.new
    next_node.x = x
    next_node.y = y

    graph.push(next_node)
  end

  next_node.times_visited += 1
  houses_visited += 1
  current = next_node
end

input_file.close

puts "New houses visited: #{graph.length}"
puts "Houses visited: #{houses_visited}"
