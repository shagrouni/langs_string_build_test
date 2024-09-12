@echo off

set  num=%1
cpp_strbld %num%
rs_strbld %num%
python py_strbld.py %num%
go_strbld %num%
oc_strbld %num%
c_strbld %num%
n_strbld %num%
d_strbld %num%
julia jl_strbld.jl %num%
fp_strbld %num%
cr_strbld %num%
cs_strbld.exe  %num%
fs_strbld.exe  %num%
dr_strbld %num%
red_strbld %num%
v_strbld %num%
java jv_strbld %num%
perl pl_strbld.pl %num%