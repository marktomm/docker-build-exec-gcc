#!/bin/sh
set -eu

cd /home

CC=/root/GCC-$1/bin/gcc

make

./a.out
