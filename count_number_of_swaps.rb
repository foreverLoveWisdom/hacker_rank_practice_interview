# Input: an array of integers .

# Output: Print the following 3 lines:
#   1. Array is sorted in #{numSwaps} swaps
#   2. First Element: #{firstElement}
#   3. Last Element: #{lastElement}

# Sample input: [1 2 3]
# Sample output:
#   Array is sorted in 0 swaps.
#   First Element: 1
#   Last Element: 3

# Constraints:
# 2 <= n <= 600
# 1 <= a[i] <= 2 * 1_000_000

def count_swaps(arr)
  i = 0
  no_of_integers = arr.size

  i.upto(no_of_integers - 1) do |outer_index|
    j = outer_index + 1
    j.upto(no_of_integers - 1) do |inner_index|
      next if arr[inner_index] >= arr[outer_index]

      no_of_swaps += 1
      swap(arr, outer_index, inner_index)
    end
  end

  puts "Array is sorted in #{no_of_swaps} swaps."
  puts "First Element: #{arr.first}"
  puts "Last Element: #{arr.last}"
end

def swap(arr, outer_index, inner_index)
  temp = arr[outer_index]
  arr[outer_index] = arr[inner_index]
  arr[inner_index] = temp
end

# count_swaps [1, 2, 3]
# count_swaps [3, 2, 1]
# count_swaps [4, 3, 2, 1]
# count_swaps [5, 4, 3, 2, 1]
count_swaps [6, 5, 4, 3, 2, 1]