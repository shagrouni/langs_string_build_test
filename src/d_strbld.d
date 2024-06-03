// gdc -O3 -frelease -o ..\exe\d_strbld d_strbld.d

import std.stdio;
import std.conv;
import std.datetime;
import std.file;

void test(long num) {
    write("  D");
    string s;
    long i;
    auto start = Clock.currTime;

    for(i = 1; i <= num; i++) {
        s ~= " D " ~ to!string(i);
    }

    auto len = s.length;

    auto elapsed = Clock.currTime - start;
    auto minutes = elapsed.total!"minutes";
    auto seconds = elapsed.total!"seconds" % 60;
    auto milliseconds = elapsed.total!"msecs" % 1000;

    writefln("  %2d:%2d:%3d Itr %d  Len %d  ", minutes, seconds, milliseconds, num, len);

    string filePath = "out/d_output.txt";
    try {
        std.file.write(filePath, s);
    } catch (Exception e) {
        writefln("Error saving string to file: %s", e.msg);
    }
}

void main(string[] args) {
    auto num = to!long(args[1]);
    test(num);
}
