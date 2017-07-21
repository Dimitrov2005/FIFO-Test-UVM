module top;
  import uvm_pkg::*; 
`include "uvm_macros.svh"
   import pack::*;
   bit clk,rst;
iface iface1(clk,rst);
   virtual iface viface=iface1;

   
   fifo DUT(.WREQ(iface1.WREQ),
	    .WD(iface1.WD),
	    .f(iface1.full),
	    .e(iface1.empty),
	    .RREQ(iface1.RREQ),
	    .RD(iface1.RD),
	    .rst(iface1.rst),
	    .clkw(iface1.clk),
	    .clkr(iface1.clk)
	    );
   initial
     begin
	clk=0;
	rst=1;
	#1ps rst=0;
     end
  
 always #5ps clk=~clk;

   initial 
     begin
	uvm_config_db #(virtual iface)::set  (null,"*","viface1",viface);
        run_test("my_test");
     end

   
endmodule:top // top
