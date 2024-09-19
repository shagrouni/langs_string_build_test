# crystal build -o ..\exe\cr_strbld.exe --release cr_strbld.cr

require "time"

def test(num : Int64)
  
  print "  Crystal"
    
    start_time = Time.monotonic

    s = String.build do |str|
    
    (1..num).each do |i|
      str << " C #{i}"
    end

    elapsed_time = Time.monotonic - start_time
    
    mins = elapsed_time.total_minutes.floor
    secs = elapsed_time.total_seconds.floor % 60
    millis = elapsed_time.total_milliseconds % 1000
    
    puts "  #{mins}:#{secs}:#{millis} Iter #{num} Len #{str.bytesize} "
     
 
    File.write("out/crystal_output.txt", str.to_s) rescue puts "Error saving string to file."

  end
end

num = ARGV[0].to_i
test(num)
