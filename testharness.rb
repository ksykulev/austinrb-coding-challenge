require 'benchmark'
require 'get_process_mem'

def get_memory_usage
  GetProcessMem.new.kb
end

if ARGV.empty?
  puts "Usage: ruby testharness.rb <filename>"
  exit 1
end

filename = ARGV[0]

unless File.exist?(filename)
  puts "Error: File '#{filename}' not found"
  exit 1
end

puts "Performance Test for #{filename}"
puts "=" * 40

initial_memory = get_memory_usage

cpu_time = Benchmark.measure do
  load filename
end

final_memory = get_memory_usage

puts "\nPerformance Metrics:"
puts "=" * 20
puts "Total execution time: #{cpu_time.real.round(4)} seconds"
puts "CPU time breakdown:"
puts "  User CPU time: #{cpu_time.utime.round(4)} seconds" 
puts "  System CPU time: #{cpu_time.stime.round(4)} seconds"
puts "  Total CPU time: #{cpu_time.total.round(4)} seconds"
puts "Memory usage:"
puts "  Initial memory: #{initial_memory.round(2)} KB"
puts "  Final memory: #{final_memory.round(2)} KB"
puts "  Memory delta: #{(final_memory - initial_memory).round(2)} KB"