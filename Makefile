all:	 
	rm -rf erl_cra* rebar3_crashreport;
	rm -rf *~ */*~;
	rm -rf test_ebin;
	rm -rf *.beam */*.beam;
	rm -rf test.rebar;
	rm -rf logs;
	rm -rf Mnesia.*;
	rm -rf _build;
	rm -rf ebin;
	rm -rf rebar.lock;
	rm -rf *_specs;
	rm -rf *_container;
	#INFO: Compile application
	rebar3 compile;
	git status
	echo Ok there you go!
	#INFO: no_ebin_commit ENDED SUCCESSFUL
clean:
	rm -rf erl_cra* rebar3_crashreport;
	rm -rf *~ */*~;
	rm -rf test_ebin;
	rm -rf log;
	rm -rf *.beam */*.beam;
	rm -rf test.rebar;
	rm -rf logs;
	rm -rf Mnesia.*;
	rm -rf _build;
	rm -rf ebin;
	rm -rf rebar.lock;
	rm -rf *_specs;
	rm -rf *_container;
	#INFO: Compile application
	rm -rf common_include;
	cp -r ~/erlang/common_include .
	rebar3 compile;
	rm -rf _build;
	rm -rf rebar.lock
#INFO: clean ENDED SUCCESSFUL
eunit: 
	rm -rf erl_cra* rebar3_crashreport;
	rm -rf *~ */*~;
	rm -rf test_ebin;
	rm -rf *.beam */*.beam;
	rm -rf test.rebar;
	rm -rf logs;
	rm -rf Mnesia.*;
	rm -rf _build;
	rm -rf ebin;
	rm -rf rebar.lock;
	rm -rf *_specs;
	rm -rf *_container;
#INFO: Creating eunit test code using test_ebin dir;
	rm -rf common_include;
	cp -r ~/erlang/common_include .
	mkdir test_ebin;
	erlc -o test_ebin test/*.erl;
	cp test/*.app test_ebin;
	rebar3 compile
	#INFO: Starts the eunit testing .................
	erl -pa test_ebin\
	 -pa _build/default/lib/micro_service_infra/ebin\
	 -sname test_micro_service_infra\
	 -run $(m) start\
	 -setcookie a

info:
	# When adding a service for testing
	# DO: test/test_appl_sup.erl add the wanted server #{id=>extra_server, start=>{extra_server,start_link,[]}},
	# DO: test_config/test.rebar.config add {extra_server,{git,"https://github.com/joq62/extra_server.git",{branch,"main"}}},
	# DO: test/all.erl add in setup function pong=extra_server.ping()
	# DO: Makefile add  -pa _build/default/lib/extra_server/ebin\
