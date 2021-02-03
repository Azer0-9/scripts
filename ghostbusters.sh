#!/bin/bash

w=/usr/share/dirb/wordlists/big.txt

u=http://$1

echo "gobuster dir -t25 --url $u --wordlist $w"

gobuster dir -t25 --url $u --wordlist $w 
