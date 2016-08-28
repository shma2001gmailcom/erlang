#!/usr/bin/env bash

src='../src/'
production='../out/production/erl0'
cd ${src}
filename='fibo.erl hello.erl'
erlc -o ${production} ${filename}
