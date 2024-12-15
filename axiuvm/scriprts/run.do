vlog ../top/axi_test_top.sv +acc
vsim  -assertdebug  axi_test_top   +UVM_TESTNAME=axi_test_slave_error
add wave /axi_test_top/dut/* 
add wave /axi_test_top/dut/axm1/*  /axi_test_top/dut/axs1/* 
add wave /axi_test_top/bfm/*  /axi_test_top/bfm/axm1/*  /axi_test_top/bfm/axs1/*  
add wave /axi_test_top/in_dut/*  /axi_test_top/in_bfm/*
add wave /axi_test_top/axi_as/axi_trnsfr /axi_test_top/axi_as/axi_size /axi_test_top/axi_as/axi_len  /axi_test_top/axi_as/axi_burst 
add wave /axi_test_top/axi_as/axi_stwadd  /axi_test_top/axi_as/axi_stradd  /axi_test_top/axi_as/axi_wrdata /axi_test_top/axi_as/axi_walined
add wave /axi_test_top/axi_as/axi_ralined  /axi_test_top/axi_as/axi_rdata 
run -all
