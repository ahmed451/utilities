#!/bin/bash

#
# A Abdelali
# aabdelali at qf dot org dot qa
# Last Update : Tue Nov  4 13:55:42 AST 2014
#

if [ "$#" -ne 2 ] && [ "$#" -ne 3 ]; then
  echo "Split file into two unequal parts using number of lines or percentages:" >&2
  echo "     Usage: $0 <FILE> <TOP>" >&2
  echo "  or"
  echo "     Usage: $0 <FILE> -p <TOP>" >&2
  exit 1
fi
len=$(wc -l $1 | cut -d' ' -f1)

if [ $2 == -p ]; then
	tper=$(($len/100))
	top=$(($3*tper))
else
	top=$(($len-$2))
fi

sed -n "1,${top}p" $1 > $1.p1
sed -n "$(($top+1)),${len}p" $1 > $1.p2
