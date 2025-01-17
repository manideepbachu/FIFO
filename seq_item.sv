class seq_item extends uvm_sequence_item;

	rand bit[7:0] data_in;
  rand bit rd;
  rand bit wr;
  bit full,empty;
  bit [7:0] data_out;

  `uvm_object_utils_begin(seq_item)
  `uvm_field_int(rd,UVM_ALL_ON)
  `uvm_field_int(wr,UVM_ALL_ON)
  `uvm_field_int(full,UVM_ALL_ON)
  `uvm_field_int(empty,UVM_ALL_ON)
  `uvm_field_int(data_in,UVM_ALL_ON)
  `uvm_field_int(data_out,UVM_ALL_ON)
  `uvm_object_utils_end
  
  function new(string name = "seq_item");
    super.new(name);
  endfunction
  
  
  
  
  constraint a_c{wr!=rd;}
  constraint wr_a{wr dist {0 :/ 4 , 1:/ 4};}
  constraint rd_a{rd dist {0 :/ 4 , 1:/ 4};}
  
endclass


