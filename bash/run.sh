#!/usr/bin/env bash

production='../out/production/erl0'
cd ${production}
erl -noshell -s fibo fibo 150000 -s init stop
#erl -noshell -s fibo fibos 5 -s init stop
#erl -noshell -s hello start 3 -s init stop
#erl -noshell -s ping_pong start 7 -s init stop
