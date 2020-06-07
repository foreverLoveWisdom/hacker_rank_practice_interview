# frozen_string_literal: true

require 'benchmark'
require 'benchmark/memory'

# Input: A string contains only A, B: 'AABAAB'
# Output: Change it into a string such that there are no matching adjacents characters
# Your task is to find the minimum number of required deletions.
#   'AABAAB' => 2

# Constraints:
# a string s: 1 <= s <= 100000

def alternatingCharacters(s)
  characters = s.chars
  i = 0
  delete_count = 0

  while i < characters.size
    while characters[i] == characters[i + 1]
      characters.delete_at(i + 1)
      delete_count += 1
    end

    i += 1
  end

  delete_count
end

chars = %w[A B]
average_input = Array.new(1000) { chars[rand(0..1)] }.join
big_input = Array.new(10_000) { chars[rand(0..1)] }.join
biggest_input = Array.new(100_000) { chars[rand(0..1)] }.join

Benchmark.bm do |x|
  x.report('Simple Input: ') { puts alternatingCharacters('AAABBAAA') }
  x.report('1000 Input: ') { puts alternatingCharacters(average_input) }
  x.report('10000 Input: ') { puts alternatingCharacters(big_input) }
  x.report('100000 Input: ') { puts alternatingCharacters(biggest_input) }
end

Benchmark.memory do |x|
  x.report('Simple Input: ') { puts alternatingCharacters('AAABBAAA') }
  puts "\n"
  x.report('1000 Input: ') { puts alternatingCharacters(average_input) }
  puts "\n"
  x.report('10000 Input: ') { puts alternatingCharacters(big_input) }
  puts "\n"
  x.report('100000 Input: ') { puts alternatingCharacters(biggest_input) }

  puts "\n"
  x.compare!
end