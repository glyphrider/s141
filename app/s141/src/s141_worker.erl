-module(s141_worker).

-behavior(gen_server).

-export([start_link/1]).
-export([init/1,handle_call/3,handle_cast/2,handle_info/2,code_change/3,terminate/2]).

start_link(Tenant) ->
	gen_server:start_link(?MODULE,[Tenant],[]).

init([Tenant]) ->
	{ok,Tenant}.

handle_call(tenant,_From,State) ->
	{reply,State,State};
handle_call(_Req,_From,State) ->
	{reply,ok,State}.
handle_cast(_Msg,State) ->
	{noreply,State}.
handle_info(_Msg,State) ->
	{noreply,State}.
code_change(OldVsn,Extra,State) ->
	{ok,State}.
terminate(Rsn,State) ->
	{ok,State}.
