class Seqencer extends uvm_sequencer#(Transaction);
   `uvm_component_utils(Seqencer)
     
     function new(string name, uvm_component parent);
	super.new(name,parent);
     endfunction // new

   