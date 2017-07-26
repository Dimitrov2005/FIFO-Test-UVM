
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
	     if(viface.rst)
	       begin
		  viface.WREQ=1'bx;
		  viface.RREQ=1'bx;
	       end
	     else
	       begin   
		  viface.WREQ<=viface.full ? 0:tr.WREQ;
		  viface.RREQ<=viface.empty ? 0:tr.RREQ;
		  viface.WD<=tr.WD;
	       end
	   seq_item_port.item_done();
	end //
   endtask // run_phase
endclass // Driver
