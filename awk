#! /bin/bash

while [ $# != 0 ]
do
  case $1 in 
    -l|--location)
	     echo "-l | --location pprovided"
		 LOCATION=$2
		 echo "$LOCATION provided as arg"
		 shift
		 shift
		 ;;
    -e|--extension)
	    echo "-e|--extension provided"
		EXTENSION=$2
		echo "extension provided as aarg"
		shift
		shift
		;;
	-s|--stats)
	    echo "-s|--stats option provided"
		;;
	-h|--help)
	    echo "-h|--help option provided"
		;;
	esac
done
==============================================================

Q2: script to find number of files in given location
test.sh -l /etc

#! /bin/bash
LOCATION=$2

if [ ! -d $LOCATION ]; then
    echo "u should provide valid directory"
	exit 1
fi

ls -l $LOCATION | awk '/^-/' | awk 'END{print "the number of files:" NR}'
