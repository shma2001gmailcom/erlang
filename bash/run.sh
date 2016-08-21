#!/usr/bin/env bash
cd ../src
erl -noshell -s fibo fibos 5555 -s init stop
