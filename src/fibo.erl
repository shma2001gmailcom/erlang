%%%-------------------------------------------------------------------
%%% @author misha
%%% @copyright (C) 2016, misha
%%% @doc
%%% Calculate Fibonacci numbers
%%% @end
%%% Created : 14. Aug 2016 9:34 PM
%%%-------------------------------------------------------------------
-module(fibo).
-author("misha").

%% API
-export([fibo/1, fib_loop/1, fibos/1]).

fibos([N]) -> fib_loop(list_to_integer(atom_to_list(N))).
fibo([N]) -> io:format(" fib(~w) = ~w~n", [N, fib(list_to_integer(atom_to_list(N)))]).

fib(N) -> fib(N, [0, 1]).

fib(1, [_, Prev]) -> Prev;
fib(N, [PrevPrev, Prev]) -> fib(N - 1, [Prev, Prev + PrevPrev]).

fib_loop(N) -> fib_loop(N, N - 1).

fib_loop(_, -1) -> done;
fib_loop(N, Shift) ->
  io:format(" fib(~w) = ~w~n", [N - Shift, fib(N - Shift)]),
  fib_loop(N, Shift - 1).



