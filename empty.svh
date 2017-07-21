class emptySeq extends uvm_sequence#(Transaction);
   `uvm_object_utils(emptySeq);
   Transaction tr;
   int num=256;

   function new(string name="");
      super.new(name);
   endfunction // new

   task body();
   endtask // body
endclass // emptySeq
