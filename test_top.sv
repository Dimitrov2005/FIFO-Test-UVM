module top;
  import uvm_pkg::*; 
`include "uvm_macros.svh"
   import pack::*;
   bit clk,rst;
Interface iface1(clk,rst);
Interface iface2(clk,rst);
   
   fifo DUT(.WREQ(iface.WREQ),
	    .WD(iface.WD),
	    .f(iface.f),
	    .e(iface.e),
	    .RREQ(iface.RREQ),
	    .RD(iface.RD),
	    .rst(iface.rst),
	    .clkw(iface.clk),
	    .clkr(iface.clk)
	    );
   initial
     begin
	clk=0;
	rst=1;
	#1 rst=0;
     end
   always #5 clk=~clk;

   initial 
     begin
	uvm_config_db #(virtual Interface)::set  (null,"uvm_test_top","iface1",iface1);
   
       uvm_config_db#(virtual Interface)::set
          (null,"uvm_test_top","iface2",iface2);
       run_test("test.svh");
   #10
     $finish
    end

   
endmodule:top // top
