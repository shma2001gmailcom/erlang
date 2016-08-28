%%%-------------------------------------------------------------------
%%% @author misha
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. Aug 2016 8:46 PM
%%%-------------------------------------------------------------------
-module(ping_pong).
-author("misha").

%% API
-export([start/0, ping/2, pong/0]).

ping(0, Pong_pid) -> Pong_pid ! finished, % send 'finished' for Pong_pid
  io:format("ping finished~n", []);
ping(N, Pong_pid) -> Pong_pid ! {ping, self()}, % send 'ping' to same address
  receive % wait for pong answer
    pong -> io:format("ping reseived pong~n", []) end, % case 'pong' received
  ping(N - 1, Pong_pid). % move far to waiting messages

pong() ->
  receive % wait for ping answer
    finished -> io:format("pong finished~n", []); % case 'finished' received
    {ping, Ping_pid} -> io:format("pong received ping~n", []), % case ' {ping, Ping_pid}' received
      Ping_pid ! pong, % send message 'ping' to process having id 'Ping_pid'
      pong() % wait for messages
  end.

start() ->
  Pong_pid = spawn(ping_pong, pong, []), % start pong to wait
  spawn(ping_pong, ping, [3, Pong_pid]). % start ping with parameters '[3, Pong_pid]'


