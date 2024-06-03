;C:\red\redc.exe -o ..\exe\red_strbld.exe red_strbld.red 
Red[]

test: function [num [integer!]] [
    prin "  Red "
	start-time: now/time/precise
    
    s: ""
	repeat i num [
        append append s " R " i
	]
   
	elapsed-time: now/time/precise - start-time

	print ["  " elapsed-time "itr" num "len" length? s]

    result: try [write %out/red_output.txt s]
    either error? result [
        print ["Error while saving the file:" mold disarm result]
    ][]
]	

num: to-integer first system/options/args

test num