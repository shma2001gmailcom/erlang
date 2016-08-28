%%%-------------------------------------------------------------------
%%% @author misha
%%% @copyright (C) 2016, misha
%%% @doc
%%% Calculate Fibonacci numbers
%%% @end
%%% Created : 28. Aug 2016 9:34 PM
%%%-------------------------------------------------------------------
-module(hello).
-author("misha").

%% API
-export([start/0, say_something/2]).

say_something(_, 0) -> done;
say_something(Something, N) ->
  io:format("~p~n", [Something]),
  say_something(Something, N - 1).

start() ->
  spawn(hello, say_something, [hello, 3]),
  spawn(hello, say_something, [goodbye, 3]).
