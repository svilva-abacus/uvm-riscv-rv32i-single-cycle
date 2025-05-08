//------------------------------------------------------------------------------
// File: CYCLE.sv
// Description: Defines the clock cycle period macro for simulation timing.
//              Default value is 10ns unless overridden during compilation.
//------------------------------------------------------------------------------
`ifndef CYCLE
  `define CYCLE 10
`endif
`timescale 1ns/1ns
