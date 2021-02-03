#!/bin/bash

echo "sudo nmap -sS -p- -n --min-rate=9362 $1"

sudo nmap -sS -p- -n --min-rate=9362 $1
