`include "uvm_macros.svh"
import uvm_pkg::*;
`include "interface.sv"
`include "package.sv"
`include "test.sv"
module tb_top;
  
  bit clk,rst;
  
  inf vif(clk,rst);
  
  always #5 clk = ~clk;
  
  fifo dut(.clk(vif.clk),.rst(vif.rst),.wr(vif.wr),.rd(vif.rd),.full(vif.full),.empty(vif.empty),.data_in(vif.data_in),.data_out(vif.data_out));
  
  initial begin
    uvm_config_db#(virtual inf)::set(null,"*","vif",vif);
  end
  
  initial begin
    rst = 1'b1;
    
    #6 rst = 1'b0;
  end
  
  initial
    run_test("test");
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
  
endmodule
