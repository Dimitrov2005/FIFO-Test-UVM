interface iface(input logic clk,rst);
   
   logic WD [7:0];
   logic WREQ;
   logic full;
   logic [7:0] RD;
   logic       RREQ;
   logic       empty;

endinterface // ifaceW

