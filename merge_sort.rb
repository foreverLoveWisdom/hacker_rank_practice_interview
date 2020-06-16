require 'benchmark'
require 'benchmark/memory'

def merge_sort(arr)
  no_of_elements = arr.size
  return if no_of_elements == 1

  middle = no_of_elements / 2

  left = arr.slice(0..middle)
  right = arr.slice(middle + 1..no_of_elements - 1)

  print("Left: #{left}. Right: #{right}")
  puts "\n"
  merge_sort(left)
  # merge_sort(right)

  # merge(merge_sort(left), merge_sort(right))
end

def merge(left, right)
  result = []
  0.upto(right.size - 1) do |index|
    if left[index] > right[index]
      result << right[index]
      result << left[index]
    else
      result << left[index]
      result << right[index]
    end
  end
  result << left.last if left.size > right.size
  result
end

def fact(n)
  n <= 1 ? 1 : n * fact(n - 1)
end

def fact_loop(n)
  return 1 if n == 0

  fact = 1
  1.upto(n) do |num|
    fact *= num
  end
  fact
end

# print merge([3, 4], [1, 2])
# merge_sort [5, 4, 3, 2, 1]
puts fact(0)
puts fact_loop(0)

Benchmark.bm do |x|
  x.report("Recursion: ") { puts fact(100) }
  x.report("Loop: ") { puts fact(100) }
end
# puts "\n \n \n"
Benchmark.memory do |x|
  x.report("Recursion: ") { puts fact(40) }
  x.report("Loop: ") { puts fact(40) }
  puts "\n"
  x.compare!
end