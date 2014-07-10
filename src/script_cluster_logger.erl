%%%-------------------------------------------------------------------
%%% @author et
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% A simple library to standardize the logging format
%%% @end
%%% Created : 23. June 2014 10:57 AM
%%%-------------------------------------------------------------------
-module(script_cluster_logger).

-export([debug/1, debug/2]).
-export([info/1, info/2]).
-export([notify/1, notify/2]).
-export([warning/1, warning/2]).
-export([error/1, error/2]).

-ifdef(TEST).
-include_lib("proper/include/proper.hrl").
-include_lib("eunit/include/eunit.hrl").
-endif.

-type label() ::atom()|binary().
-type key() ::atom()|bianry().
-type value() ::atom()|binary().

-spec debug(label()) -> ok.
-spec debug(label(), [{key(), value()}]) -> ok.
-spec info(label()) -> ok.
-spec info(label(), [{key(), value()}]) -> ok.
-spec notify(label()) -> ok.
-spec notify(label(), [{key(), value()}]) -> ok.
-spec warning(label()) -> ok.
-spec warning(label(), [{key(), value()}]) -> ok.
-spec error(label()) -> ok.
-spec error(label(), [{key(), value()}]) -> ok.

%%% Public Api %%%

%% @doc Wrapper around lager debug. Standardize logging format:
%%      debug(<<"This is a log.">>)
%%      should log as This is a log
%% @end
debug (Label) ->
  debug (Label, []).

%% @doc Wrapper around lager debug. Standardize logging format:
%%      debug(<<"This is a log.">>, [{a, <<"A">>}, {b, <<"B">>}])
%%      should log as This is a log. a=A b=B etc.
%% @end
debug (Label, KV) ->
  {Label, Msg} = log(),
  lager:debug(Label, Msg).

log(Label, [])->
  

build_msg(Msg,[])->
  Msg;
build_msg(Msg, [H|T]) ->
  {K,V} = H, 
  Msg = io:format("~tp=~tp", [K,V]),
  build_msg(Msg, T).


%%% Internal Api %%%


-ifdef(TEST).
simple_logging_test_()->
  {
	
  }.



-endif.

