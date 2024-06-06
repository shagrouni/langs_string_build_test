//v v_strbld.v -prod -o ..\exe\v_strbld.exe
module main

import os
import strings
import time

fn test(num int) {
    print('  V')

    mut sb := strings.new_builder(11)
    start := time.now()

    for i in 0 ..num {
        sb.write_string(' V $i')
    }   
    elapsed := time.now() - start
    	
	minutes := int(elapsed.minutes())
	seconds := int(elapsed.seconds()) % 60
	milliseconds := elapsed.milliseconds() % 1000
    
    ilen := sb.len
    println('  ' + minutes.str() + ':' + seconds.str() + ':' + milliseconds.str() + ' Iter: ' + num.str() + '  Len: ' + ilen.str())
    
    file_path := 'out/v_output.txt'

    os.write_file(file_path, sb.str()) or {
        eprintln('Failed to write to the file')
        return
    }    
 }

fn main() {
    num := os.args[1].int()
    test(num)
}
