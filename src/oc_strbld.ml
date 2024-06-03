(*ocamlc -I +unix unix.cma -o ..\exe\oc_strbld.exe oc_strbld.ml*)

let test num =
  let s = Buffer.create 16 in
  let start_time = Unix.gettimeofday () in 
  
  for i = 1 to num do
    Buffer.add_string s (" O " ^ string_of_int i)
  done;

  let length = Buffer.length s in

  let elapsed_time = Unix.gettimeofday () -. start_time in 
  let minutes = int_of_float (elapsed_time /. 60.) in 
  let seconds = int_of_float (elapsed_time) mod 60 in 
  let milliseconds = int_of_float (elapsed_time *. 1000.) mod 1000 in 

  Printf.printf "  OCaml  %02d:%02d:%03d Iter %d: Len %d \n" minutes seconds milliseconds num length;

  let file_path = "out/ocaml_output.txt" in

  try
    let oc = open_out file_path in
    Buffer.output_buffer oc s;
    close_out oc
  with
  | _ -> Printf.printf "Error saving string to file: %s\n" file_path


let () =
  let num = int_of_string Sys.argv.(1) in
  test num