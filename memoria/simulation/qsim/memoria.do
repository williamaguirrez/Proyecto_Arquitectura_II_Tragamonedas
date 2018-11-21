onerror {quit -f}
vlib work
vlog -work work memoria.vo
vlog -work work memoria.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.memoria_vlg_vec_tst
vcd file -direction memoria.msim.vcd
vcd add -internal memoria_vlg_vec_tst/*
vcd add -internal memoria_vlg_vec_tst/i1/*
add wave /*
run -all