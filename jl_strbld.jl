function test(num::Int64)
    println("  Julia")

    start_time = time()
    buf = IOBuffer()
    for i in 1:num
        print(buf, " J ", i)
    end
    s = String(take!(buf))
    elapsed_time = time() - start_time

    mins = floor(elapsed_time / 60)
    secs = floor(elapsed_time % 60)
    millis = floor((elapsed_time * 1000) % 1000)

    println("  $mins:$secs:$millis Iter $num Len $(sizeof(s)) ")
    try
        open("out/julia_output.txt", "w") do f
            write(f, s)
        end
    catch e
        println("Error saving string to file.")
    end
end

num = parse(Int64, ARGS[1])
test(num)