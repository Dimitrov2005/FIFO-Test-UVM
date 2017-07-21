
class Driver extends uvm_driver #(Transaction);
   
   `uvm_component_utils(Driver)
     Transaction tr;
     virtual iface viface;

   function new(string name, uvm_component parent);
      super.new(name,parent);
   endfunction; // new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase) ;
     
   endfunction // build_phase

   task run_phase(uvm_phase phase);
      forever
	begin
	   wait(viface.rst==0); 
	   @(posedge viface.clk)
	     tr=Transaction::type_id::create("tr");
	     seq_item_port.get_next_item(tr);
	   viface.WREQ<=tr.WREQ;
	   viface.RREQ<=tr.RREQ;
	   viface.WD<=tr.WD;
	   viface.RD<=tr.RD;
	   viface.full<=tr.full;
	   viface.empty<=tr.empty;
	   seq_item_port.item_done();
	end //
   endtask // run_phase
endclass // Driver
