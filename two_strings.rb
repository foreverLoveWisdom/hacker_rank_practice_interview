# frozen_string_literal: true

# Given two strings, determine if they share a common substring.
# A substring may be as small as one character.
# For example, the words "a", "and", "art" share the common substring
# The words "be" and "cat" do not share a substring.

# Input: string s1, string s2
# Output: YES if s1 and s2 have common substring(s). Otherwise, output NO

# Example:
#   Input:
#     s1: hello
#     s2: world
#   Output: YES

#   Input:
#     s1: hi
#     s2: world
#   Output: NO

# Constraints:
# p, number of test cases
# s1 and s2 consists of characters in the range ascii[a-z]
# 1 <= p <= 10
# 1 <= |s1|, |s2| <= 10_000

def count_occurrence_of_char(str, hash)
  str.chars.each do |char|
    hash[char.to_sym] ? next : hash[char.to_sym] = 'E'
  end

  hash
end

def two_strings(s1, s2)
  s1_char_occurrence = count_occurrence_of_char(s1, {})
  s2_char_occurrence = count_occurrence_of_char(s2, {})

  s1_char_occurrence.each do |char, _|
    return print 'YES' unless s2_char_occurrence[char].nil?
  end

  print 'NO'
end

two_strings('hello', 'world')
two_strings('hello', 'abc')

