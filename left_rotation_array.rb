require 'benchmark'
require "benchmark/memory"

# input: ([1, 2, 3, 4, 5], 2)
# output: [3, 4, 5, 1, 2]
# An array a of n integers.
# A number d for left rotation.
# A left rotation operation on an array shifts each of the array's elements unit to the left.
# Constraints:
# 1 =< n =< 100,000
# 1 =< d =< n
# 1 =< a[i] =< 1,000,000. Maximum num in array is 1,000,000 and minimum num is 1.

def rotLeft(a, d)
  # Time Complexity: O(n)
  # Space Complexity: O(n)

  rotated_arr = Array.new(a.size)

  a.each_with_index do |num, index|
    rotated_arr[index - d] = num
  end

  print rotated_arr
end

average_input = Array.new(1000).map { |num| num = rand(1..1000000) }
big_input = Array.new(10000).map { |num| num = rand(1..1000000) }
biggest_input = Array.new(100000).map { |num| num = rand(1..1000000) }


Benchmark.bm do |x|
  x.report("Simple Input: ") { puts rotLeft([1, 2, 3, 4, 5], 2) }
  x.report("1000 Input: ") { puts rotLeft(average_input, 2) }
  x.report("10000 Input: ") { puts rotLeft(big_input, 2) }
  x.report("100000 Input: ") { puts rotLeft(biggest_input, 2) }
end

puts "\n \n \n"
Benchmark.memory do |x|
  x.report("Simple Input: ") { puts rotLeft([1, 2, 3, 4, 5], 2) }
  puts "\n"
  x.report("1000 Input: ") { puts rotLeft(average_input, 2) }
  puts "\n"
  x.report("10000 Input: ") { puts rotLeft(big_input, 2) }
  puts "\n"
  x.report("100000 Input: ") { puts rotLeft(biggest_input, 2) }

  puts "\n"
  x.compare!
end