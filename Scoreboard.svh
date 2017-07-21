class Scoreboard extends uvm_scoreboard;

   `uvm_component_utils(Scoreboard)

    uvm_tlm_analysis_fifo#(Transaction) fifo;
   logic [7:0] q[$];
   int 	       countm=0;
   Transaction tr;

   function new(string name, uvm_component parent);
      super.new(name,parent);
      tr=new("tr");
   endfunction // new

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      fifo=new("fifo",this);
   endfunction // build_phase

   
   task run();
      forever 
	begin
	   fifo.get(tr);
	   if(tr.WREQ)
	     pushFull(tr);
	   else if(tr.RREQ)
	     popEmpt(tr);   

	
  
	end 
   endtask // run 

   function void pushFull(Transaction tr);
      if((q.size()==256) && (tr.full))begin
	$display("SCBF","--------FIFO IS FULL OK------");
      end
      
      else 
	   q.push_front(tr.WD);
      
   endfunction // pushFull

   function void popEmpt(Transaction tr);
      if((q.size()==0)&&(tr.empty))begin
	`uvm_info("SCBE","--------FIFO EMPTY IS OK ------",UVM_NONE);
end
      else if(tr.RD!=q.pop_back())begin
	`uvm_error("SCBE","--------Data Mismatch------");
      countm++;
end
   endfunction // popEmpt

  
   function void report_phase(uvm_phase phase);
$display("total mismatches : %d ",countm);
endfunction // report_phase
   
 
endclass :Scoreboard

