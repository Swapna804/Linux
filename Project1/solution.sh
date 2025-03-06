#!/bin/bash
# Thu 06 Mar 2025 09:44:00 AM UTC

# Variables
BASE=/home/ubuntu/Desktop
DAYS=10
DEPTH=1
RUN=0

# Check if directory is present or not
if [ ! -d $BASE ]  
then  
    echo "directory dont exist: $BASE"
    exit 1
fi

# Create archive folder if not present
if [ ! -d $BASE/archieve ]  
then  
    mkdir $BASE/archieve
fi

# Find list of files larger than 20MB
for i in `find $BASE -maxdepth $DEPTH -type f -size +20MB`  
do  
    if [ $RUN -eq 0 ]  
    then  
        echo "[$(date "+%Y-%m-%d %H:%M:%S")] archiving $i ==> $BASE/archieve"
        gzip $i || exit 1
        mv $i.gz $BASE/archieve || exit 1
    fi  
done
