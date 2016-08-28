#!/usr/bin/env bash

production='../out/production/erl0'
cd ${production}
erl -noshell -s fibo fibos 5 -s init stop
erl -noshell -s hello start -s init stop
erl -noshell -s ping_pong start -s init stop
