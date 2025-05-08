//------------------------------------------------------------------------------
// File: clkgen.sv
// Description: Clock generator module that produces a continuous clock signal
//              with 50% duty cycle. The clock period is determined by the
//              CYCLE macro defined in CYCLE.sv.
//------------------------------------------------------------------------------
`include "CYCLE.sv"
module clkgen (
  output logic clk);
  initial begin
    clk <= '0;
    forever #(`CYCLE/2) clk = ~clk;
  end
endmodule
