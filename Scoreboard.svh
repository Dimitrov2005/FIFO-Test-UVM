class Scoreboard extends uvm_scoreboard;

    `uvm_component_utils(Scoreboard)

   uvm_analysis_export#(Transaction) analysis_export;

   function new(string name, uvm_component parent);
      super.new(name,parent);
   endfunction // new
   

     function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	analysis_export=new("analysis_export",this);
     endfunction // build_phase

   virtual function void write(Transaction tr);
   $display("SCB TR REC :: ");
     tr.print();
endfunction:write
endclass :Scoreboard

