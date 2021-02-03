#!/bin/bash

echo "nmap -A -sC -sV -T4 -Pn -p$2 $1"

nmap -A -sC -sV -T4 -Pn -p$2 $1
