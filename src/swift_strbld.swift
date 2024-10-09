// swiftc -Ounchecked swift_strbld.swift -o ..\exe\swift_strbld.exe

import Foundation

func formatTime(milliseconds timeMs: UInt) -> String {
  let milliseconds = timeMs % 1000
  let seconds = (timeMs / 1000) % 60
  let minutes = (timeMs / 1000) / 60
  
  return String(format: "%02d:%02d:%02d", minutes, seconds, milliseconds)
}

func print(_ items: Any..., separator: String = " ") {
  write(
    to: FileHandle.standardOutput,
    items,
    separator: separator,
    terminator: ""
  )
}

func println(_ items: Any..., separator: String = " ") {
  write(
    to: FileHandle.standardOutput,
    items,
    separator: separator,
    terminator: "\n"
  )
}

func eprint(_ items: Any..., separator: String = " ") {
  write(
    to: FileHandle.standardError,
    items,
    separator: separator,
    terminator: ""
  )
}

func eprintln(_ items: Any..., separator: String = " ") {
  write(
    to: FileHandle.standardError,
    items,
    separator: separator,
    terminator: "\n"
  )
}

func write(
  to fileHandle: FileHandle,
  _ items: Any...,
  separator: String = " ",
  terminator: String = "\n"
) {
  let output = items
    .map { String(describing: $0) }
    .joined(separator: separator).appending(terminator)
  fileHandle.write(output.data(using: .utf8)!)
}

public func test(_ num: Int64) {
  print("  Swift")
  
  var s = ""
  var i: Int64 = 0
  
  let now = Date()

  for _ in 1...num {
    i += 1
    s.write(" S \(i)")
  }
  
  let elapsed = Date().timeIntervalSince(now)
  
  let length = s.utf8.count
  
  let formattedTime = formatTime(milliseconds: UInt(elapsed * 1000.0))
  println("  \(formattedTime) iter \(i) len \(length)")
  
  let filePath = URL(filePath: "out/swift_output.txt")
  
  do {
    try s.write(to: filePath, atomically: true, encoding: String.Encoding.utf8)
  } catch let error {
    eprintln("Error saving string to file: \(error)")
  }
}

let args: [String] = ProcessInfo.processInfo.arguments
if args.count != 2 {
  eprintln("Usage: \(args[0]) <num>")
  exit(1)
}

guard let num: Int64 = Int64(args[1]) else {
  fatalError("Invalid input for num")
}

test(num)
