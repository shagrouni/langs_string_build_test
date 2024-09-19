# crystal build -o ..\exe\cr_strbld.exe --release cr_strbld.cr

require "time"

def test(num : UInt64)
  print "  Crystal"

  start_time = Time.monotonic

  s = String.build do |str|
    (1u64..num).each do |i|
      str << " C " << i
    end
  end

  elapsed_time = Time.monotonic - start_time

  mins = elapsed_time.total_minutes.floor.to_i
  secs = elapsed_time.total_seconds.floor % 60
  millis = elapsed_time.total_milliseconds % 1000

  puts "  %02d:%02d:%03d iter #{num} len #{s.bytesize} " % {mins, secs, millis}

  begin
    File.write("out/crystal_output.txt", s)
  rescue ex
    puts "Error saving string to file: #{ex}"
  end
end

num = ARGV[0].to_u64
test(num)