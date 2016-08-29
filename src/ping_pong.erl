%%%-------------------------------------------------------------------
%%% @author misha
%%% @copyright (C) 2016, misha
%%% @doc
%%%
%%% @end
%%% Created : 28. Aug 2016 8:46 PM
%%%-------------------------------------------------------------------
-module(ping_pong).
-author("misha").

%% API
-export([start/1, ping/2, pong/0]).

ping(0, Pong_pid) -> Pong_pid ! finished, % send 'finished' for process having id 'Pong_pid'
  io:format("ping finished~n", []);
ping(N, Pong_pid) -> Pong_pid ! {message(N), self()}, % send 'ping' to same address as above
  receive % wait for pong answer
    left -> io:format("left reseived pong ~n", []); % case 'left' received
    right -> io:format("right reseived pong ~n", []) % case 'right' received
  end,
  ping(N - 1, Pong_pid). % move far to waiting messages

pong() ->
  receive % wait for ping answer
    finished -> io:format("pong finished~n", []); % case 'finished' received
    {left, Ping_pid} -> io:format("left received ping~n", []), % case ' {left, Ping_pid}' received
      Ping_pid ! left, % send message 'left' to process having id 'Ping_pid'
      pong(); % wait for messages
    {right, Ping_pid} -> io:format("right received ping~n", []), % case ' {right, Ping_pid}' received
      Ping_pid ! right, % send message 'right' to process having id 'Ping_pid'
      pong() % wait for messages
  end.

message(0) -> left;
message(1) -> right;
message(N) -> message(N - 2).


start([N]) ->
  io:format("~n~n ping-pong~n", []),
  Pong_pid = spawn(ping_pong, pong, []), % start pong to wait
  spawn(ping_pong, ping, [list_to_integer(atom_to_list(N)), Pong_pid]). % start ping with parameters '[N, Pong_pid]'


