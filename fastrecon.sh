#!/bin/bash
#created:24/12/2020
#author:agent0range9

#what I want out of this script is an automated version of what I already do for my reconnaissance process during CTF's. I intend on using premade scripts during my oscp exam to make things even faster than they already are.

#first I wish to use /tmp as in a real world scenario I would like to keep things clean and not have to do too much cleanup.
cd /tmp

#next I will make a directory to keep everything in with the name given and enter said directory.i
echo "***directory creation***"
echo "the name of target?: "
read target_name
echo "making directory $target_name..."
mkdir $target_name
echo "changing directories to $target_directory..."
cd $target_name

#now to start scanning, I always start with port discovery.
echo "***port discovery***"
echo "IP address for $target_name?: "
read IP
echo "starting port scan...(will need sudo for this part)"
ports=$(sudo nmap -sS -p- -n --min-rate=9362 $IP | grep tcp | cut -d'/' -f1)

#replaces the spaces with commas for the -p tack in nmap.
#fixed= echo $ports | awk -v OFS="," '{$1=$1;print}'

#then I finish with an aggressive scan to get more information. I save the output of the last command as nmap.scan.
echo "starting aggressive scan..."
echo "nmap -A -sC -sV -T4 -Pn -p$($ports | awk -v OFS="," '{$1=$1;print}') $IP"
nmap -A -sC -sV -T4 -Pn -p$(echo $ports | awk -v OFS="," '{$1=$1;print}') $IP -oN nmap.scan
