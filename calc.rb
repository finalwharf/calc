#!/usr/bin/env ruby

require 'readline'
require_relative 'calc/calc'

def run
  calc = Calc.new

  puts "Welcome to Calc."
  puts "Type an expression or ^C to exit."
  puts

  while line = Readline.readline('>> ', true) do
    expression = line.strip
    result = calc.eval(expression)
    puts "=> #{result}"
  end
  puts "\nExiting..."
end

Signal.trap("INT") do
  puts "\nExiting..."
  exit
end

if __FILE__ == $0
  run
end
