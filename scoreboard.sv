`uvm_analysis_imp_decl(_mon1)
`uvm_analysis_imp_decl(_mon2)
`uvm_analysis_imp_decl(_mon3)

class scoreboard extends uvm_scoreboard;
  
  `uvm_component_utils(scoreboard)
  
  uvm_analysis_imp_mon1#(int,scoreboard) sb_port_mon1;
  uvm_analysis_imp_mon2#(int,scoreboard) sb_port_mon2;
  uvm_analysis_imp_mon3#(int,scoreboard) sb_port_mon3;
  
  int t_count1,t_count2,t_count3;
  
  function new(string name = "scoreboard", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sb_port_mon1 = new("sb_port_mon1",this);
    sb_port_mon2 = new("sb_port_mon2",this);
    sb_port_mon3 = new("sb_port_mon3",this);
  endfunction
  
  function void write_mon1(int t_count);
    t_count1 = t_count;
    `uvm_info(get_name(),$sformatf("FORM MON1 t_count1 = %0d",t_count1),UVM_NONE)
  endfunction
  
  function void write_mon2(int t_count);
    t_count2 = t_count;
    `uvm_info(get_name(),$sformatf("FORM MON2 t_count2 = %0d",t_count2),UVM_NONE)
  endfunction
  
  function void write_mon3(int t_count);
    t_count3 = t_count;
    `uvm_info(get_name(),$sformatf("FORM MON3 t_count3 = %0d",t_count3),UVM_NONE)
  endfunction

endclass