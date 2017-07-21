class randSeq extends uvm_sequence#(Transaction);
 
   `uvm_object_utils(randSeq);
   Transaction tr;
   int num=5;
   logic f,e;
   function new(string name ="");
      super.new(name);
   endfunction // new

   task body();
      tr=Transaction::type_id::create("tr");
      repeat(num) begin
	 start_item(tr);
	 if(e)
	   begin 
	      assert(tr.randomize() with {tr.RREQ==0;})
		     else `uvm_fatal("FE","Fatal Error During Randomization");
	    end
	  else  if(f) 
	     begin 
	        assert(tr.randomize() with {tr.WREQ==0;})
	        else `uvm_fatal("FE","Fatal Error During Randomization");
	      end
		
	 finish_item(tr);
	 e=tr.empty;
	 f=tr.full;
	 
      end
   endtask // body
   
endclass // randSeq

