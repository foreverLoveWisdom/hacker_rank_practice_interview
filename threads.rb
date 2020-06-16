# What is a thread?
# what is a process: A program in execution. One single program can have many processes.
# A thread is a basic unit of a process in execution. A process can have anywhere from 1 -> many threads.
# A thread contains:
#   thread ID
#   a program counter
#   a register set
#   a stack
#   It shares with other threads belonging to the same process its code section, data section, and other
#   operating system resources, such as files and signals.
# A traditional process will have 1 thread of control. If a process has multiple threads,
#   can perform multiple tasks at a time.
#

puts "Trying to read in some files..."
t = Thread.new do
  (0..2).each do |n|
    begin
      File.open("part0#{n}") do |f|
        text << f.readlines
      end
    rescue Errno::ENOENT
      puts 'Rescuing error and gonna kill this thread...'
      puts "Message from thread: Failed on n=#{n}"
      Thread.exit
    end
  end
end

t.join
puts 'finished...'