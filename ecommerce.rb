require 'benchmark'
require 'benchmark/memory'
require "objspace"

logs = ['30 99 sign-in', '30 105 sign-out', '21 110 sign-in', '15 100 sign-in', '15 120 sign-out']
maxspan = 20

sample_logs = []
sign_in_types = %w[sign-in sign-out]
1.upto(10_000) do |n|
  id = n.to_s
  sign_in_time = rand(100..150)
  0.upto(1) do |m|
    sign_in_time = m.zero? ? sign_in_time : sign_in_time + rand(50)
    type = sign_in_types[m]
    sample_logs << (id + ' ' + sign_in_time.to_s + ' ' + type)
  end
end

puts "Number of elements: #{sample_logs.size}"
puts ObjectSpace.memsize_of(sample_logs) / 1_000_000.0

def filter_log(logs, maxspan)
  hash = {}
  logs.each do |str|
    temp = str.split(' ')
    if hash[temp.first.to_sym] && temp.include?('sign-out')
      hash[temp.first.to_sym] << temp[1]
    else
      hash[temp.first.to_sym] = [temp[1]]
    end
  end

  result = []
  hash.each do |key, value|
    next if value.count < 2

    result << key.to_s if value[1].to_i - value[0].to_i <= maxspan
  end

  result
end

def session_logged_out?(data)
  data.include?('sign-out')
end

# Time Complexity: O(n), n is the number of elements in our log.
# Space Complexity: O(n), n is the number of elements in our log.
def filter_log(logs, maxspan)
  hash = {}
  logs.each do |str|
    temp = str.split(' ')
    id_key = temp.first

    if hash[id_key] && session_logged_out?(temp)
      hash[id_key] << temp[1]
    else
      hash[id_key] = [temp[1]]
    end
  end

  result = []
  hash.each do |id, sessions|
    next if sessions.count < 2

    result << id if sessions[1].to_i - sessions[0].to_i <= maxspan
  end

  result
end

Benchmark.bm do |x|
  # x.report("Symbol: ") { filter_log(sample_logs, 20) }
  x.report("String: ") { filter_log_in_string(logs, 20) }
end

Benchmark.memory do |x|
  # x.report("Symbol: ") { filter_log(sample_logs, 20) }
  x.report("String: ") { filter_log_in_string(logs, 20) }
  puts "\n"
  x.compare!
end
