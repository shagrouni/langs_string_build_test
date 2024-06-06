//rustc -C opt-level=3  rs_strbld.rs -o ..\exe\rs_strbld.exe
use std::fs;
use std::time::Instant;
use std::env;
use std::io::{self, Write};

fn format_time(time_ms: u128) -> String {
  let milliseconds = time_ms % 1000;
  let seconds = (time_ms / 1000) % 60;
  let minutes = (time_ms / 1000) / 60;
  
  format!("{:02}:{:02}:{02}", minutes, seconds, milliseconds)
}

pub fn test(num: i64) {
    print!("  Rust");
    io::stdout().flush().unwrap();

    let mut s = String::from("");
    let now = Instant::now(); 
    let mut i: i64 = 0; 
     
    for _ in 1..=num {
        i += 1;
        s.push_str(&format!(" R {}", i)); 
     }

    let elapsed = now.elapsed(); 
    let len = s.len();

    let s_time = format_time(elapsed.as_millis());
    println!("  {} itr {} len {}", s_time, i, len);

    let file_path = "out/rust_output.txt";
    match fs::write(file_path, s) {
        Ok(_) => (),
        Err(e) => eprintln!("Error saving string to file: {}", e),
    } 
}

  fn main () {
 
    let args: Vec<String> = env::args().collect();
    if args.len() != 2 {
        eprintln!("Usage: {} <num>", args[0]);
        std::process::exit(1);
    }

    let num: i64 = args[1].parse().expect("Invalid input for num");

    test(num);    

  }  
