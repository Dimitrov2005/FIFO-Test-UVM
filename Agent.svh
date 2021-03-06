class Agent extends uvm_agent;
   
  `uvm_component_utils(Agent)  // register in comp db
   agent_config agent_cfg;
   Driver drv;
   Monitor mon;
   Sequencer seq;
   uvm_analysis_port#(Transaction)aportAgnt ; //declare drv, seq, mon aport

     // provide constructor
     function new(string name, uvm_component parent);
	super.new(name,parent);
     endfunction 
   // new
   

   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      aportAgnt=new("aportAgnt",this);//build aport with new
      
      if(!uvm_config_db#(agent_config)::get
	 (this,"","agent_cfg",agent_cfg))
	begin
	   `uvm_error("fifo_agent","agent_config not found");
	end
     
     drv=Driver::type_id::create("drv",this);//build others with factory
     seq=Sequencer::type_id::create("seq",this);
     mon=Monitor::type_id::create("mon",this);
   endfunction // build_phase
   
   
   function void connect_phase(uvm_phase phase);
      super.connect_phase(phase);
      mon.viface=agent_cfg.viface;  
      mon.aportMon.connect(aportAgnt);//connect monitor to agent
      drv.seq_item_port.connect(seq.seq_item_export);//con drv to seq
      drv.viface=agent_cfg.viface; 

   endfunction //end connect_phase
   
endclass // Agent


