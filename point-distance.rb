# frozen_string_literal: true

# rubocop:disable Naming/MethodParameterName

class Point
  def initialize(x, y)
    @x, @y = x, y
  end

  def x
    @x
  end

  def y
    @y
  end

  def distance
    Math.sqrt((@x**2) + (@y**2)) # ((x^2)+(y^2))^(1/2)
  end
end

def read
  line = gets.chomp

  inputs = line.split

  x = inputs[0].to_i
  y = inputs[1].to_i
  [x, y]
end

def main
  x, y = read

  p = Point.new(x, y)
  puts p.distance
end

main

# rubocop:enable Naming/MethodParameterName
