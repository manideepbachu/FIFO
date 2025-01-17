class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)
  
  virtual inf vif;
  uvm_analysis_port#(seq_item) ap;
  seq_item mon_seq;
  
  
  function new(string name = "monitor",uvm_component parent = null);
    super.new(name,parent);
    ap = new("ap",this);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual inf)::get(this," ","vif",vif))
      `uvm_fatal(get_type_name,"no interface");
    mon_seq = seq_item::type_id::create("mon_seq");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      wait(vif.wr || vif.rd);
      @(negedge vif.clk);
      mon_seq.wr = vif.wr;
      mon_seq.rd = vif.rd;
      mon_seq.full = vif.full;
      mon_seq.empty = vif.empty;
      mon_seq.data_in = vif.data_in;
      
      @(negedge vif.clk);
      mon_seq.data_out = vif.data_out;
      
      $display("monitor : wr = %0d || rd = %0d || full = %0d || empty = %0d || data_in = %0d||dout = %0d",mon_seq.wr,mon_seq.rd,mon_seq.full,mon_seq.empty,mon_seq.data_in,mon_seq.data_out);
      
      ap.write(mon_seq);
    end
  endtask
  
endclass

    
