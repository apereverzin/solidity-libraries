#!/usr/bin/env bash

function solc-err-only {
    solc "$@" 2>&1 | grep -A 2 -i "Error"
}

solc-err-only --overwrite --optimize --bin --abi ./contracts/SafeMath.sol -o ./build/
solc-err-only --overwrite --optimize --bin --abi ./contracts/ERC20Basic.sol -o ./build/
cd ./build
wc -c SafeMath.bin | awk '{print "SafeMath: " $1}'
wc -c ERC20Basic.bin | awk '{print "ERC20Basic: " $1}'
