%%%-------------------------------------------------------------------
%%% @author misha
%%% @copyright (C) 2016, misha
%%% @doc
%%% spawn
%%% @end
%%% Created : 28. Aug 2016 9:34 PM
%%%-------------------------------------------------------------------
-module(hello).
-author("misha").

%% API
-export([start/1, say_something/2]).

say_something(_, 0) -> done;
say_something(Something, N) ->
  io:format("~p~n", [Something]),
  say_something(Something, N - 1).

start([N]) ->
  io:format("~n~n hello-goodbye", []),
  spawn(hello, say_something, [hello, list_to_integer(atom_to_list(N))]),
  spawn(hello, say_something, [goodbye, list_to_integer(atom_to_list(N))]).
