# crystal build -o ..\exe\cr_strbld.exe --release cr_strbld.cr

require "time"

def test(num : Int64)
  print "  Crystal"

  start_time = Time.monotonic

  s = String.build do |io|
    (1..num).each do |i|
      io << " C #{i}"
    end
  end

  elapsed_time = Time.monotonic - start_time

  mins = elapsed_time.minutes
  secs = elapsed_time.seconds
  millis = elapsed_time.milliseconds

  puts "  #{mins}:#{secs}:#{millis} Iter #{num} Len #{s.bytesize} "

  File.write("out/crystal_output.txt", s.to_s) rescue puts "Error saving string to file."
end

num = ARGV[0].to_i
test(num)
