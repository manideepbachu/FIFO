class driver extends uvm_driver#(seq_item);
  `uvm_component_utils(driver)
  
  virtual inf vif;
  
  function new(string name = "driver",uvm_component parent = null);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!uvm_config_db#(virtual inf)::get(this," ","vif",vif))
      `uvm_fatal(get_type_name,"no interface");
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive();
      seq_item_port.item_done(req);
    end
  endtask
  
  task drive();
    @(posedge vif.clk);
    vif.wr <= req.wr;
    vif.rd <= req.rd;
    vif.full <= req.full;
    vif.empty <= req.empty;
    vif.data_in <= req.data_in;
    
    @(posedge vif.clk);
    vif.wr <= 1'b0;
    vif.rd <= 1'b0;
    
    $display("driver : wr = %0d || rd = %0d || full = %0d || empty = %0d || data_in = %0d||dout = %0d",vif.wr,vif.rd,vif.full,vif.empty,vif.data_in,vif.data_out);
    
  endtask
  
endclass

  
