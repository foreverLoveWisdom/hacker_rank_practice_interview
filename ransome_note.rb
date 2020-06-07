# frozen_string_literal: true

require 'benchmark'
require 'benchmark/memory'

# Input: 2 arrays
#   1 is array of words in the magazine.
#   1 is array of words in the ransom note.

# Output: If can replicate the ransom note from the magazine
#   print Yes
#   else No

# Constraints:
#   Case sensitive
#   m, number of words in magazine
#   n, number of words in ransom note
#   1 <= m, n <= 30000
#   1 <= magazine[i], note[i] <= 5

def check_magazine(magazine, note)
  # Time complexity: O(n+m)
  # Space complexity: O(n+m)
  magazine_hash = {}
  note_hash = {}

  magazine.each do |word|
    magazine_hash[word.to_sym] ? magazine_hash[word.to_sym] += 1 : magazine_hash[word.to_sym] = 1
  end

  note.each do |word|
    note_hash[word.to_sym] ? note_hash[word.to_sym] += 1 : note_hash[word.to_sym] = 1
  end

  note_hash.each do |word, occurrence|
    return print 'No' unless magazine_hash[word] && (magazine_hash[word] >= occurrence)
  end

  print 'Yes'
end

puts check_magazine(%w[two times three is not four], %w[two times two is four])
puts check_magazine(%w[give me one grand today night], %w[give one grand today])
puts check_magazine(%w[ive got a lovely bunch of coconuts], %w[ive got some coconuts])
puts check_magazine(%w[apgo clm w lxkvg mwz elo bg elo lxkvg elo apgo apgo w elo bg], %w[elo lxkvg bg mwz clm w])

Benchmark.memory do |x|
  x.report('Simple Input: ') do
    check_magazine(%w[apgo clm w lxkvg mwz elo bg elo lxkvg elo apgo apgo w elo bg], %w[elo lxkvg bg mwz clm w])
  end

  puts "\n"
    # x.compare!
end