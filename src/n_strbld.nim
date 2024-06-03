# nim c -d:release --opt:speed -o:..\exe\n_strbld.exe n_strbld.nim
import os, times, strformat, strutils, system

proc test(num: int) =

  stdout.write("  Nim")
  let startTime = epochTime()
  var s: string
  
  for i in 1..num:
    s.add(fmt" N {i}")

  let elapsedTime = epochTime() - startTime
  let minutes = int(elapsedTime / 60)
  let seconds = int(elapsedTime) mod 60
  let milliseconds = int((elapsedTime - float(minutes * 60 + seconds)) * 1000)

  echo fmt"  {minutes}:{seconds}:{milliseconds} Iter {num} Len {s.len} "

  let file_path = "out/nim_output.txt"

  try:
    writeFile(file_path, s)
  except Exception as e:
    echo fmt"Error saving string to file: {e.msg}"

  echo "Nim finished."

when isMainModule:
  if paramCount() != 1:
    echo "Usage: ", getAppFilename(), " <num>"
    quit(1)

  let num = parseInt(paramStr(1))
  test(num)