#!/bin/bash
DIR=$1/*

randname()
{
    if [[ -n $1 ]] && [[ "$1" -lt 20 ]]; then
        local len=$1;
    else
        local len=8;
    fi

    local seed=$$`date +%N`; # seed will be the pid + nanoseconds
    local res=$( echo $seed | md5sum | md5sum );     
    res="${res:2:len}"
    echo $res
}

if [ "$1" = "" ]; then
    echo �адай�ие и��одн�й ка�алог
    exit
fi

if [ "$2" = "" ]; then
    echo �адай�ие коне�н�й ка�алог
    exit
fi

if [ ! -d $1/backup ]; then
    mkdir $1/backup
fi

tmpname=$(randname)
for i in $DIR
do
    if [ -d "$i" ]; then
        continue
    fi
    mpg123 -s "$i" | oggenc --raw -o $2/$(randname)".ogg" -
    echo $i
    mv "$i" $1/backup/
done
