//dart compile exe dr_strbld.dart -o ..\exe\dr_strbld.exe
import 'dart:io';
import 'dart:convert';

void test(int num) {
  stdout.write("  Dart");
  var s = StringBuffer();
  var startTime = DateTime.now();
  num += 1;
  for (var i = 1; i < num; i++) {
    s.write(" D $i");
  }

  var elapsedTime = DateTime.now().difference(startTime);

  var minutes = elapsedTime.inMinutes;
  var seconds = elapsedTime.inSeconds % 60;
  var milliseconds = elapsedTime.inMilliseconds % 1000;

  print("  $minutes:$seconds:${milliseconds.toString().padLeft(2, '0')} Iter $num Len ${s.length} ");

  var filePath = "out/dart_output.txt";

  try {
    File(filePath).writeAsStringSync(s.toString());
  } catch (e) {
    print("Error saving string to file: $e");
  }
}

void main(List<String> arguments) {
  var arg = arguments[0];
  var num = int.parse(arg);

  test(num);
}