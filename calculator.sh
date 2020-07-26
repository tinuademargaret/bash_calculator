#!/bin/bash

add() {

let x=($arg1 + $arg2)

}

subtract() {
if [[ $arg1 -gt $arg2 ]]; then
let x=($arg1 - $arg2)
elif [[ $arg2 -gt $arg1 ]]; then
let x=($arg2 - $arg1);
fi;
} 

multiply() {
let x=($arg1 * $arg2)
}

divide() {
if [[$arg2 -ne 0]]; then
let x=($arg1 / $arg2);
fi
}

arg1=$1 ; arg2=$2 ; op=$3 


[[ $# -lt 3 ]] && echo 'Usage: enter three arguments, two numbers and an operation of either a,d,m or s' && exit 1

[[ $op != a ]] || [[ $op != d ]] || [[ $op != m ]] || [[ $op != s ]] || echo operator must be a,s,m,or d and not $op supplied 

if [[ $op == a ]] ; then add $arg1 $arg2
elif [[ $op == s ]] ; then subtract $arg1 $arg2
elif [[ $op == m ]] ; then multiply $arg1 $arg2
elif [[ $op == d ]] ; then divide $arg1 $arg2
else echo operator must be a,s,m,or d and not $op supplied aborting exit 2
fi

echo $arg1 $op $arg2 : $x

