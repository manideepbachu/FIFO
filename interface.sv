interface inf(input bit clk,rst);
  logic rd,wr;
  logic full,empty;
  logic[7:0] data_in;
  logic[7:0] data_out;
endinterface

