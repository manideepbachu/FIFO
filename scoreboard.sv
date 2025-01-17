`uvm_analysis_imp_decl(_data)
class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
  uvm_analysis_imp_data#(seq_item,scoreboard) aimp;
  //seq_item sb_seq;
  int q[$];
  
  
  function new(string name = "scoreboard",uvm_component parent = null);
    super.new(name,parent);
    aimp = new("aimp",this);
  endfunction
  
//   function void build_phase(uvm_phase phase);
//     super.build_phase(phase);
//     sb_seq = seq_item::type_id::create("sb_seq");
//   endfunction
  
  
  function void write_data(seq_item c_seq);
    bit [7:0] expdata;
    
    if(c_seq.wr)begin
      q.push_back(c_seq.data_in);
      $display("________________________________________");
      $display("q = %0p",q);
      $display("________________________________________");
    end
    
    else if(c_seq.rd) begin
      if(q.size() >= 1'b1)begin
        expdata = q.pop_front();
        
        
        if(expdata == c_seq.data_out)begin
          `uvm_info(get_full_name(), "==================\\\PASSED\\\===================", UVM_LOW);
        end
        
        else
          `uvm_info(get_full_name(), "==================\\\FAILED\\\===================", UVM_LOW);
        
      end
    end
  endfunction
  
          
         
endclass

