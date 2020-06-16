require 'benchmark'
require "benchmark/memory"

def test_recursion(num)
  return num if num == 1

  num + test_recursion(num - 1)
end

def test_tail_recursion(num, total = 0)
  return total if num.zero?

  test_tail_recursion(num - 1, total + num)
end

def factorial(n)
  return 1 if n == 1

  n * factorial(n - 1)
end

def tail_factorial(num, fact = 1)
  return fact if num == 1

  tail_factorial(num - 1, fact * num)
end

# input = 10_009
# Benchmark.bm do |x|
#   x.report("Recursion: ") { puts factorial(input) }
#   x.report("Tail Recursion: ") { puts tail_factorial(input) }
# end
#
#
# Benchmark.memory do |x|
#   x.report("Recursion: ") { puts factorial(input) }
#   x.report("Tail Recursion: ") { puts tail_factorial(input) }
#
#   puts "\n"
#   x.compare!
# end

