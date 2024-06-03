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
gcc -O3 -march=native -funroll-loops -Ofast c_strbld.c -o ..\exe\c_strbld.exe
rem clang -o c_strbld_llvm.exe c_strbld.c

@echo compiling C++ ...
g++ cpp_strbld.cpp -o ..\exe\cpp_strbld.exe
rem g++ -o3 -march=native -mtune=native -ffast-math -funroll-loops -flto cpp_strbld.cpp -o cpp_strbld.exe

@echo compiling OCaml ...
rem ocamlc -o ..\exe\oc_strbld.exe oc_strbld.ml
rem ocamlc -no-keep-docs -no-keep-locs -no-keep-locs -o ..\exe\oc_strbld.exe oc_strbld.ml
ocamlc -I +unix unix.cma -o ..\exe\oc_strbld.exe oc_strbld.ml
del oc_strbld.obj oc_strbld.cmi oc_strbld.cmx oc_strbld.cmo

@echo compiling Nim ...
nim c -d:release --opt:speed -o:..\exe\n_strbld.exe n_strbld.nim

@echo compiling D ...
gdc -O3 -frelease -o ..\exe\d_strbld d_strbld.d
strip ..\exe\d_strbld.exe

@echo compiling Crystal ...
crystal build -o ..\exe\cr_strbld.exe --release cr_strbld.cr
del ..\exe\gc.dll ..\exe\libiconv.dll ..\exe\pcre2-8.dll ..\exe\cr_strbld.pdb

@echo compiling C# ...
dotnet build --configuration Release cs_strbld.csproj -o ..\exe

@echo compiling F# ...
dotnet build --configuration Release fs_strbld.fsproj -o ..\exe

@echo compiling Red ...
C:\red\redc.exe -o ..\exe\red_strbld.exe red_strbld.red 
del ..\exe\libRedRT-defs.r ..\exe\libRedRT-include.red ..\exe\libRedRT-extras.r

copy py_strbld.py ..\exe\py_strbld.py
copy jl_strbld.jl ..\exe\jl_strbld.jl


                                                              