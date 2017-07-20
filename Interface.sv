interface iface(input logic clk,rst);
   
   logic[7:0] WD ;
   logic WREQ;
   logic full;
   logic [7:0] RD;
   logic       RREQ;
   logic       empty;

  // modport mpRead(output empty,[7:0] RD,
//		  input RREQ,clk,rst);
//
//   modport mpWrite(input WREQ,clk,rst, [7:0]WD,
//		   output full);
   
endinterface // ifaceW

