help:
	@echo "======================================================================"
	@echo "Usage:" 
	@echo "  > make regress          - run all tests & generate summary"
	@echo "  > make <test_name>      - run individual test [see list below]"
	@echo "  > make clean            - run CLEAN script"
	@echo "  > make summary          - run generate_summary.py loads each test result into summary.text gives report as PASS or FAIL"
	@echo "    -----------------------------------------"
	@echo "    test_index      test_name"
	@echo "    -----------------------------------------"
	@echo "    1              axi_test_base"
	@echo "    2              axi_test_fixied"
	@echo "    3              axi_test_increment"
	@echo "    4              axi_test_wrapping"
	@echo "    5              axi_test_incr_4tr"
	@echo "    6              axi_test_wrp_4tr"
	@echo "    7              axi_test_unalined_tr"
	@echo "    8              axi_test_slave_error"
	@echo "======================================================================"

compile:
	vlog ../top/axi_test_top.sv +acc

all_test: axi_test_base axi_test_fixied axi_test_increment axi_test_wrapping \
          axi_test_incr_4tr axi_test_wrp_4tr axi_test_unalined_tr axi_test_slave_error

axi_test_base: compile
	vsim -assertdebug axi_test_top +UVM_TESTNAME=$@ -do "do wave.do; run -all; write transcript $@.log;"

axi_test_fixied: compile
	vsim -assertdebug axi_test_top +UVM_TESTNAME=$@ -do "do wave.do; run -all; write transcript $@.log;"

axi_test_increment: compile
	vsim -assertdebug axi_test_top +UVM_TESTNAME=$@ -do "do wave.do; run -all; write transcript $@.log;"

axi_test_wrapping: compile
	vsim -assertdebug axi_test_top +UVM_TESTNAME=$@ -do "do wave.do; run -al; write transcript $@.log;"

axi_test_incr_4tr: compile
	vsim -assertdebug axi_test_top +UVM_TESTNAME=$@ -do "do wave.do; run -all; write transcript $@.log;"

axi_test_wrp_4tr: compile
	vsim -assertdebug axi_test_top +UVM_TESTNAME=$@ -do "do wave.do; run -all; write transcript $@.log;"

axi_test_unalined_tr: compile
	vsim -assertdebug axi_test_top +UVM_TESTNAME=$@ -do "do wave.do; run -all; write transcript $@.log;"

axi_test_slave_error: compile
	vsim -assertdebug axi_test_top +UVM_TESTNAME=$@ -do "do wave.do; run -all; write transcript $@.log;"

clean:
	@if exist work (rmdir /s /q work)
	@del /q transcript vsim.wlf *.log modelsim.ini summary.txt 2>nul

summary:
	python generate_summary.py

regress: all_test summary  
