
class Driver extends uvm_driver #(Transaction);
   
   `uvm_component_utils(Driver)
     virtual iface viface;

   function new(string name, uvm_component parent);
      super.new(name,parent);
   endfunction; // new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase) ;
     
   endfunction // build_phase

   task run_phase(uvm_phase phase);
       Transaction tr;
      forever
	begin
	   wait(viface.rst==0);
	   seq_item_port.get_next_item(tr);
	   @(posedge viface.clk)
	   viface.WREQ<=tr.WREQ;
	   viface.RREQ<=tr.RREQ;
	   viface.WD<=tr.WD;
	   seq_item_port.item_done(tr);
	end //
   endtask // run_phase
endclass // Driver
