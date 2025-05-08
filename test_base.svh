//------------------------------------------------------------------------------
// File: test_base.svh
// Description: Base UVM test class that serves as the foundation for all specific
//              test cases in the RISC-V verification environment. This class 
//              creates the environment instance and implements common UVM test 
//              phases. It provides infrastructure for factory manipulation and
//              hierarchy printing during simulation startup.
//------------------------------------------------------------------------------
`ifndef TEST_BASE_SVH
`define TEST_BASE_SVH

class test_base extends uvm_test;
  
  `uvm_component_utils(test_base)
  
  // Factory instance for type overrides and printing
  uvm_factory factory = uvm_factory::get();
  
  // Environment instance
  env e;
 
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e = env::type_id::create("e", this);
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info("TB", "test_base: end_of_elaboration", UVM_FULL)
  endfunction
  
  function void start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    if (uvm_report_enabled(UVM_HIGH)) begin
      this.print();
      factory.print();
    end
    `uvm_info("TB", "test_base: start_of_simulation", UVM_FULL)
  endfunction
  
endclass

`endif
