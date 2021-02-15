#!/bin/bash
grep $1 0315_Dealer_schedule |
grep $2 |
awk -F" " '{print $1, $2, $5, $6}'

