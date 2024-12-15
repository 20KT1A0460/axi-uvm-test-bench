# axi-uvm-test-bench
axi master and slave uvm test bench  :
## adove files contain both rtl and uvm testbench
-> in rtl int contain :
    * axi_master.v
    * axi_slave.sv
         has  each   32 bit and 0 to 500 locations  memory.
    * axi_top.sv
    * it is accroding to axi3.
-> in uvm_testbench :
    * 8 testcases
    * 8 sequence
      * as  base,icrement,wrapping,fixied,increment 4 transfers ,wrapping 4 transfers, unalined ,slave_error.
## makefile && generate_summary.py file:
   -> makefile :
      * to test regress ,generate summary as pass or fail
   -> generate_summary.py :
       * it is python script file which automatically detects *.log files and detects text PASS && FAIL  
       and gives summary as PASS or FAIL to each test.
## Simulation
  [axi_uvm_simulation_video] (https://drive.google.com/file/d/1Ap8rDO57e1Bpy2rP_fp6H7RMFxsRCfBm/view?usp=drive_link)
