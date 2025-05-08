//------------------------------------------------------------------------------
// File: dut_if.sv
// Description: Encapsulates all signals between the
//              testbench and the RISC-V processor DUT. This interface defines
//              the instruction memory interface, data memory interface, and reset
//              signals. It includes a clocking block (cb1) for synchronizing
//              signal sampling and driving with respect to the clock.
//------------------------------------------------------------------------------
`include "CYCLE.sv"
`define Tdrive #(0.2*`CYCLE)

interface dut_if(input clk);
  // Control signals
  logic          reset_n;
  
  // Instruction memory interface
  logic          instr_mem_req_o;
  logic [31:0]   instr_mem_addr_o;
  logic [31:0]   instr_mem_rd_data_i;
  
  // Data memory interface
  logic          data_mem_req_o;
  logic [31:0]   data_mem_addr_o;
  logic [1:0]    data_mem_byte_en_o;
  logic          data_mem_wr_o;
  logic [31:0]   data_mem_wr_data_o;
  logic [31:0]   data_mem_rd_data_i;
  
  // Clocking block for synchronous signal access
  clocking cb1 @(posedge clk);
    // default input #1step output `Tdrive;
    // Testbench outputs (DUT inputs)
    output        reset_n;
    output        instr_mem_rd_data_i;
    output        data_mem_rd_data_i;
    
    // Testbench inputs (DUT outputs)
    input         instr_mem_req_o;
    input         instr_mem_addr_o;
    input         data_mem_req_o;
    input         data_mem_addr_o;
    input         data_mem_byte_en_o;
    input         data_mem_wr_o;
    input         data_mem_wr_data_o;
  endclocking
  
endinterface
