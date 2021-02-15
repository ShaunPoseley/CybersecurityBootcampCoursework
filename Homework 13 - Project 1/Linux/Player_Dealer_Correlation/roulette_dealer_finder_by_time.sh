#!/bin/bash
awk -F[:," "] '{print "The roulette dealer at " $1 $4, $7, $8}' $1_Dealer_schedule |
grep $2
