#!/usr/bin/env bash
cd ../out/production/erl0
erl -noshell -s fibo fibos 5 -s init stop
