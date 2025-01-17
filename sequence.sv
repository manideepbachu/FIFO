class write_sqnc extends uvm_sequence#(seq_item);
  
  `uvm_object_utils(write_sqnc)
  seq_item tr;
  
  function new(string name ="write_sqnc");
    super.new(name);
  endfunction
  
  task body();
    repeat(4) begin
       
      `uvm_do_with(tr,{tr.wr == 1;})
     $display("\nsequence : wr = %0d || rd = %0d || full = %0d || empty = %0d || data_in = %0d||dout = %0d",tr.wr,tr.rd,tr.full,tr.empty,tr.data_in,tr.data_out);
    end
  endtask
endclass


///////////////////////////////////////////////////////////////////


class read_sqnc extends uvm_sequence#(seq_item);
  
  `uvm_object_utils(read_sqnc)
  seq_item tr;
  
  function new(string name ="read_sqnc");
    super.new(name);
  endfunction
  
  task body();
    repeat(4) begin
      
    `uvm_do_with(tr,{tr.rd == 1;})
      $display("\n\nsequence : wr = %0d || rd = %0d || full = %0d || empty = %0d || data_in = %0d||dout = %0d",tr.wr,tr.rd,tr.full,tr.empty,tr.data_in,tr.data_out);
    end
  endtask
endclass
