//------------------------------------------------------------------------------
// File: testbench.sv
// Description: Top-level testbench module for UVM-based verification of yarp_top.
//              Instantiates the DUT, clock generator, and interface. Sets up the
//              virtual interface connection and initiates the UVM test framework.
//------------------------------------------------------------------------------
`include "CYCLE.sv"  // Defines clock cycle time using `CYCLE macro
`include "clkgen.sv" // Clock generator module definition
`include "tb_pkg.sv" // UVM testbench package: all classes (agent, env, test)
`include "uvm_macros.svh" // UVM macros (e.g., `uvm_component_utils, `uvm_info, etc.)

module top;
  
  import uvm_pkg::*; // import uvm base classes
  import tb_pkg::*; // import testbench classes
  
  //Clock Signal
  logic clk;
  
  //Connecting clk signal to clkgen module
  // Generates continuous clock signal for simulation

  clkgen ck (clk); 
  
  
  // DUT (Design Under Test) Instantiation
  // Connects required signals to the DUT from the interface
  yarp_top dut(.clk(clk),
               .reset_n(dif.reset_n),
               .instr_mem_rd_data_i(dif.instr_mem_rd_data_i),
               .data_mem_rd_data_i(dif.data_mem_rd_data_i),
               .instr_mem_req_o(dif.instr_mem_req_o),
               .instr_mem_addr_o(dif.instr_mem_addr_o),
               .data_mem_req_o(dif.data_mem_req_o),
               .data_mem_addr_o(dif.data_mem_addr_o),
               .data_mem_byte_en_o(dif.data_mem_byte_en_o),
               .data_mem_wr_o(dif.data_mem_wr_o),
               .data_mem_wr_data_o(dif.data_mem_wr_data_o)
            
              );

  // Interface Instantiation
  dut_if         dif (clk);
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
     
    // Register the interface as a virtual interface 
    uvm_resource_db#(virtual dut_if)::set("*", "vif", dif);  // UVM-style
    
    //Start UVM test and phases
    run_test("");
  end

 endmodule
