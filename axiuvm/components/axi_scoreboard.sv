class axi_scoreboard extends uvm_scoreboard;
   `uvm_component_utils(axi_scoreboard)
    
    `uvm_analysis_imp_decl(_bfm)
    `uvm_analysis_imp_decl(_dut)

    uvm_analysis_imp_bfm#(axi_seq_item_base,axi_scoreboard) axi_tlm_bfm_scrb;

    uvm_analysis_imp_dut#(axi_seq_item_base,axi_scoreboard) axi_tlm_dut_scrb;

    uvm_tlm_analysis_fifo#(axi_seq_item_base)  axi_tlm_b_fifo;
    uvm_tlm_analysis_fifo#(axi_seq_item_base)  axi_tlm_d_fifo;

    string test_status;

    int axi_pass ,axi_fail;

    function new(string en="",uvm_component pa);
       super.new(en,pa);
       
       axi_tlm_bfm_scrb=new("axi_tlm_bfm_scrb",this);

       axi_tlm_dut_scrb=new("axi_tlm_dut_scrb",this);

       axi_tlm_b_fifo=new("axi_tlm_b_fifo",this);
       axi_tlm_d_fifo=new("axi_tlm_d_fifo",this);

    endfunction

    axi_seq_item_base axi_seqt_bfm_scrb,axi_seqt_dut_scrb;


  function void build_phase(uvm_phase phase);
   axi_seqt_bfm_scrb=axi_seq_item_base::type_id::create("axi_seqt_bfm_scrb");  
   axi_seqt_dut_scrb=axi_seq_item_base::type_id::create("axi_seqt_dut_scrb");

  endfunction 

  task write_bfm(axi_seq_item_base axi_bfm_temp);
  axi_tlm_b_fifo.write(axi_bfm_temp);
  endtask

  task write_dut(axi_seq_item_base axi_dut_temp);
  axi_tlm_d_fifo.write(axi_dut_temp);
  endtask
   

  task run_phase(uvm_phase phase);
    forever begin
        axi_tlm_b_fifo.get(axi_seqt_bfm_scrb);
        axi_tlm_d_fifo.get(axi_seqt_dut_scrb);

        if(axi_seqt_bfm_scrb.compare(axi_seqt_dut_scrb))begin
            uvm_report_info(get_type_name(),"axi_test_pass");
            axi_seqt_bfm_scrb.print();
            axi_seqt_dut_scrb.print();
            axi_pass++;
        end

        else  begin
            uvm_report_info(get_type_name(),"axi_test_fail");
            axi_seqt_bfm_scrb.print();
            axi_seqt_dut_scrb.print();
            axi_fail++;

        end
    end
  endtask


  function void extract_phase(uvm_phase phase);
  $display("*****************************axi test  pass && fail report  **********************************************************************");
    uvm_report_info(get_type_name(),$sformatf("axi_pass_count=%d",axi_pass));
    uvm_report_info(get_type_name(),$sformatf("axi_fail_count=%d",axi_fail));
  $display("##################################################################################################################################");
   
  $display("*****************************over all test status ********************************************************************************");
   if(!axi_fail)
           test_status="PASS";
   else
           test_status="FAIL";

 $display("test_status=%s",test_status);

 $display("###################################################################################################################################");
  endfunction 


endclass
