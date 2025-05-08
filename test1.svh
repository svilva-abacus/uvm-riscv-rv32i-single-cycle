//------------------------------------------------------------------------------
// File: test1.svh
// Description: Specific test case that extends the base test framework. This test
//              runs three different sequences in parallel to verify the RISC-V
//              processor's ability to handle different instruction types 
//              concurrently. The test launches basic transactions, memory 
//              operations, and branch instructions simultaneously to create a
//              comprehensive verification scenario.
//------------------------------------------------------------------------------
`ifndef TEST1_SVH
`define TEST1_SVH

class test1 extends test_base;
  `uvm_component_utils(test1)
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    
    `uvm_info("test1", "about to do seq.start", UVM_LOW)
    
    fork  
      begin
        tr_sequence seq = tr_sequence::type_id::create("seq");
        seq.start(e.agnt.sqr);
      end
      
      begin 
        mem_sequence mem_seq = mem_sequence::type_id::create("mem_seq");
        mem_seq.start(e.agnt.sqr);
      end
      
      begin 
        branch_sequence bseq = branch_sequence::type_id::create("bseq");
        bseq.start(e.agnt.sqr);
      end
    join 
    
    `uvm_info("DEBUG", "this is the end of the test", UVM_LOW)
    phase.drop_objection(this, "TEST_DONE");
  endtask
endclass

`endif
