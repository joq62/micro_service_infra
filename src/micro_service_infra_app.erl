%%%-------------------------------------------------------------------
%% @doc application_server public API
%% @end
%%%-------------------------------------------------------------------

-module(micro_service_infra_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    micro_service_infra_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
