//------------------------------------------------------------------------------
// File: tb_pkg.sv
// Description: Main package file for the RISC-V processor verification environment. 
//              Contains all UVM components including transactions, sequences, 
//              agents, monitors, scoreboard components, and test cases.
//              This package organizes the complete verification hierarchy and
//              serves as the central inclusion point for all verification classes.
//------------------------------------------------------------------------------
`ifndef TB_PKG__SV
`define TB_PKG__SV
`include "CYCLE.sv"
`include "uvm_macros.svh"
`include "dut_if.sv"
package tb_pkg;
  import uvm_pkg::*;
   
  // Transaction and coverage
  `include "trans1.svh"
  `include "tb_cover.svh"
  
  // Agent components
  `include "tb_driver.svh"
  `include "tb_sequencer.svh"
  `include "tb_monitor.svh"
  `include "tb_agent.svh"
  
  // Scoreboard components
  `include "sb_predictor.svh"
  `include "sb_comparator.svh"
  `include "tb_scoreboard.svh"
  
  // Environment
  `include "env.svh"
  
  // Sequences
  `include "tr_sequence.svh"
  `include "mem_sequence.svh"
  `include "branch_sequence.svh"
  
  // Tests
  `include "test_base.svh"
  `include "test1.svh"
  
  // Reference model
  `include "sb_calc_exp.svh"
endpackage                        
`endif
