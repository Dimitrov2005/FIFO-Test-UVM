
class Driver extends uvm_driver #(Transaction);
   
   `uvm_component_utils(Driver)

     virtual iface viface;

   function new(string name, uvm_component parent);
      super.new(name,parent);
   endfunction; // new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      //
      //
   endfunction // build_phase

   task run_phase(uvm_phase phase);
      phase.raise_objection(this);
      repeat(5)
	begin
	   Transaction tr;
	   @(posedge viface.clk)
	     seq_item_port.get_next_item(tr);
	   viface.WREQ=tr.WREQ;
	   viface.RREQ=tr.RREQ;
	   viface.WD=tr.WD;
	   viface.RD=tr.RD;
	   viface.full=tr.full;
	   viface.empty=tr.empty;
	   seq_item_port.item_done(tr);
	end // repeat (5)
      @(posedge viface.clk)// wait the next clock to say RDY 
	phase.drop_objection(this);
   endtask // run_phase
endclass // Driver
