class test extends uvm_test;
   `uvm_component_utils(test)
     Environment env;
   env_config env_cfg;
   agent_config agent_cfg1;
   agent_config agent_cfg2;

   function new(string name, uvm_component parent);
      super.new(name,parent);
   endfunction // new
   
   function void build_phase(uvm_phase phase);
      super.build_phase(phase);

      env_cfg=env_config::type_id::create("env_cfg");
      agent_cfg1=agent_config::type_id::create("agent_cfg1");
      agent_cfg2=agent_config::type_id::create("agent_cfg2");
      
      if(!uvm_config_db#(virtual iface)::get
         (this,"","iface1",agent_cfg1.viface))begin
	 `uvm_error("TINF","base_test iface1 not found");
	 end
       if(!uvm_config_db#(virtual iface)::get
	    (this,"","iface2",agent_cfg2.viface) )begin
	    `uvm_error("TINF","base_test iface2 not found");
end
	    //--------create agnt config files and assign them to env_cgf/
	    env_cfg.agent_cfg1=agent_cfg1;
	    env_cfg.agent_cfg2=agent_cfg2;

	    uvm_config_db#(env_config)::set
	    (this,"","env_cfg",env_cfg);

	    env=Environment::type_id::create("env",this);
	    
   endfunction // build_phase
	  

  task run_phase(uvm_phase phase);
	  randSeq randSeq_h;
	  randSeq_h=randSeq::type_id::create("randSeq");
	  randSeq_h.start(env.agent1.seq);
   endtask


 endclass:test // base_test
	    