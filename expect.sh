#!/bin/bash

function usage(){
echo "usage:"
echo -e "\tthis script need two agruments."
echo -e "\tthe \$1 is ip table."
echo -e "\tthe \$2 is code."
}

function ssh_expect(){
coding="$2"
sk=`cat ./bass`       #password-file
for  line in `cat  $1`;do
	expect   expect $line $sk "$coding"
done
}

##########################################

if [ $# -ne 2 ]
then
        usage
        exit
else
	echo $2
	ssh_expect "$1" "$2"
#>&ssh_-e_result.log
fi
cp ssh_-e_result.log /tmp/ssh_-e_result/`date +%Y-%m-%d-%H-%M`.log
