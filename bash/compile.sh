#!/usr/bin/env bash

src='../src/'
cd ${src}
filename='endouble.erl fac.erl fibo.erl'
erlc ${filename}
