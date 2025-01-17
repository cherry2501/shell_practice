#!/bin/bash

a=$1 #pass variable as args positional
b=$2

sum=$(($a+$b))
sub=$(($a - $b))
echo "sum of $a and $b is: $sum"
echo "sub of $a and $b is: $sub"