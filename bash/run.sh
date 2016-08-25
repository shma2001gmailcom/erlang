#!/usr/bin/env bash
cd ../src
erl -noshell -s fibo fibos 5 -s init stop
