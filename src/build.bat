@echo off

@echo compiling V ...
v v_strbld.v -prod -o ..\exe\v_strbld.exe

@echo compiling Go ... 
go build -ldflags "-s -w" -o ..\exe\go_strbld.exe go_strbld.go

@echo compiling Rust ...
rem rustc -C opt-level=3  rs_strbld.rs
rem rustc -C llvm-args="-unroll-count=4"  rs_strbld.rs
rustc -C opt-level=3  rs_strbld.rs -o ..\exe\rs_strbld.exe
del ..\exe\rs_strbld.pdb

@echo compiling Free Pascal ...
fpc fp_strbld.pas -v0 -o..\exe\fp_strbld.exe
del ..\exe\fp_strbld.o

@echo compiling C ...
gcc -march=native -funroll-loops -Ofast c_strbld.c -o ..\exe\c_strbld_1.exe
gcc -O3 -march=native -funroll-loops -Ofast c_strbld.c -o ..\exe\c_strbld_2.exe
rem clang -o c_strbld_llvm.exe c_strbld.c

@echo compiling C++ ...
g++ cpp_strbld.cpp -o ..\exe\cpp_strbld_1.exe
g++ -O3 cpp_strbld.cpp -o ..\exe\cpp_strbld_2.exe
rem g++ -o3 -march=native -mtune=native -ffast-math -funroll-loops -flto cpp_strbld.cpp -o cpp_strbld.exe

@echo compiling OCaml ...
ocamlc -I +unix unix.cma -o ..\exe\oc_strbld.exe oc_strbld.ml
del oc_strbld.obj oc_strbld.cmi oc_strbld.cmx oc_strbld.cmo

@echo compiling Nim ...
nim c -d:release --opt:speed -o:..\exe\n_strbld_2.exe n_strbld.nim

@echo compiling D ...
gdc -O3 -frelease -o ..\exe\d_strbld d_strbld.d
strip ..\exe\d_strbld.exe

@echo compiling Crystal ...
crystal build -o ..\exe\cr_strbld.exe --release cr_strbld.cr
del ..\exe\gc.dll ..\exe\libiconv.dll ..\exe\pcre2-8.dll ..\exe\cr_strbld.pdb

@echo compiling C# ...
dotnet build --configuration Release cs_strbld.csproj -o ..\exe

@echo compiling F# code ...
dotnet build --configuration Release fs_strbld.fsproj -o ..\exe

@echo compiling Red code ...
C:\red\redc.exe -o ..\exe\red_strbld.exe red_strbld.red 
del ..\exe\libRedRT-defs.r ..\exe\libRedRT-include.red ..\exe\libRedRT-extras.r

@echo compiling Dart code ...
dart compile exe dr_strbld.dart -o ..\exe\dr_strbld.exe

copy py_strbld.py ..\exe\py_strbld.py
copy jl_strbld.jl ..\exe\jl_strbld.jl
copy pl_strbld.pl ..\exe\pl_strbld.pl

@echo building Java ...
javac -d ..\exe jv_strbld.java
                                                              