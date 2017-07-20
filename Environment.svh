class Environment extends uvm_env;
  
 `uvm_component_utils(Environment)
   
   env_config env_cfg;
   Agent agent1;
   Agent agent2;
   Scoreboard scb;

   function new(string name, uvm_component parent);
      super.new(name,parent);
   endfunction // new

   
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      
      //--------check if env_cfg exist in uvm_config_db ------//
      if(!uvm_config_db#(env_config) :: get
	 (this,"","env_cfg",env_cfg))
	begin //---- send error -----//
	   `uvm_error("ECNF","Environment config not found");
	end
      
      if(env_cfg.has_agent1)
	begin
	   //-------set agent 1 config--------//
	   uvm_config_db#(agent_config):: set
	     (this,"agent1*","agent_cfg",env_cfg.agent_cfg1);
	   agent1=Agent::type_id::create("agent1",this);
	end

      if(env_cfg.has_agent2)
	begin
	   // --- set agent 2 config and create --- //

	   uvm_config_db#(agent_config) :: set
	     (this,"agent2*","agent_cfg",env_cfg.agent_cfg2);
	   agent2=Agent::type_id::create("agent2",this);
	end

      if(env_cfg.has_scoreboard)
	begin
	   scb=Scoreboard::type_id::create("scb",this);
	     end
   endfunction // build_phase

   function void connect_phase(uvm_phase phase);
      if(env_cfg.has_agent1) // something can go wrong here //
      agent1.aportAgnt.connect(scb.analysis_export);
	  endfunction // connect_phase

endclass // Environment

