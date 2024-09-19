//rustc -C opt-level=3  rs_strbld.rs -o ..\exe\rs_strbld.exe
use std::env;
use std::fmt::Write as _;
use std::fs;
use std::io::{self, Write};
use std::time::Instant;

fn format_time(time_ms: u128) -> String {
    let milliseconds = time_ms % 1000;
    let seconds = (time_ms / 1000) % 60;
    let minutes = (time_ms / 1000) / 60;

    format!("{minutes:02}:{seconds:02}:{milliseconds:02}")
}

pub fn test(num: i64) {
    print!("  Rust");
    io::stdout().flush().unwrap();

    let mut s = String::from("");
    let now = Instant::now();
    let mut i: i64 = 0;

    for _ in 1..=num {
        i += 1;
        // write!(s, " R {i}").unwrap();
        s.push_str(" R ");
        write!(s, "{i}").unwrap();
    }

    let elapsed = now.elapsed();
    let len = s.len();

    let s_time = format_time(elapsed.as_millis());
    println!("  {s_time} iter {i} len {len}");

    let file_path = "out/rust_output.txt";
    match fs::write(file_path, s) {
        Ok(_) => (),
        Err(e) => eprintln!("Error saving string to file: {e}"),
    }
}

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() != 2 {
        eprintln!("Usage: {path} <num>", path = args[0]);
        std::process::exit(1);
    }

    let num: i64 = args[1].parse().expect("Invalid input for num");

    test(num);
}
