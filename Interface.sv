interface iface(input logic clk,rst);
   
   logic[7:0] WD ;
   logic WREQ;
   logic full;
   logic [7:0] RD;
   logic       RREQ;
   logic       empty;
   
endinterface // ifaceW

