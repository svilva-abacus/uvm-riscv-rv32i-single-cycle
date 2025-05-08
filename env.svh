//------------------------------------------------------------------------------
// File: env.svh
// Description: Top-level UVM environment class that coordinates the verification
// of the RISC-V processor. Integrates and connects the agent, scoreboard, and
// coverage components into a complete verification framework.
//------------------------------------------------------------------------------
`ifndef ENV_SVH
`define ENV_SVH 

class env extends uvm_env;
  // Verification components
  tb_agent      agnt;  // Agent for stimulus generation and monitoring
  tb_scoreboard sbd;   // Scoreboard for checking results
  tb_cover      cov;   // Coverage collector
  
  `uvm_component_utils(env)
 
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
     
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agnt = tb_agent::type_id::create("agnt", this);
    sbd  = tb_scoreboard::type_id::create("sbd", this);
    cov  = tb_cover::type_id::create("cov", this);
  endfunction
    
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agnt.ap.connect(sbd.axp);           // Connect agent to scoreboard
    agnt.ap.connect(cov.analysis_export); // Connect agent to coverage
  endfunction
    
endclass

`endif
