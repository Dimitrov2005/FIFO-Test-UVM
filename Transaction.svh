class Transaction extends uvm_sequence_item;
   `uvm_object_utils(Transaction);

   rand logic [7:0] WD; 
   rand logic  WREQ,RREQ;
   //not random vars
   logic [7:0] RD;
   logic       empty,full;
   

   constraint wrNotRr {RREQ != WREQ ;}
   constraint wr_rr_dist{ 
      WREQ dist {1:/70,0:/30};
      RREQ dist {1:/30,0:/70};
   }

   function new(string name = "");
      super.new(name);
   endfunction // new
endclass // transaction
