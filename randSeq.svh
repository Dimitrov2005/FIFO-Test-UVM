class randSeq extends uvm_sequence#(Transaction);
 
   `uvm_object_utils(randSeq);
   Transaction tr;
   int num=5;

   function new(string name ="");
      super.new(name);
   endfunction // new

   task body();
      tr=Transaction::type_id::create("tr");
      repeat(num) begin
	 start_item(tr);
	 assert(tr.randomize())
	   else `uvm_fatal("FE","Fatal Error During Randomization");
	 finish_item(tr);
      end
   endtask // body
endclass // randSeq

