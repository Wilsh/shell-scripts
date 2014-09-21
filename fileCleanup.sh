#!/bin/sh
#Andrew Seligman
#Removes zero-length files in the given directory or in the
#current directory if none is specified

usage='USAGE: '$0' [directory path]'

if [ $# -eq 0 ]
then
    #no command line argument given; use current directory
    path=.
elif [ ! -d $1 ]
then
    #command line argument is not a directory
    echo Error: Argument is not a directory
    echo $usage
    exit 1
elif [ $# -eq 1 ]
then
    #use given path from command line
    path=$1
else
    #excess number of command line arguments
    echo Error: Too many arguments
    echo $usage
    exit 2
fi

for file in `find $path -type f -size 0`
do
    echo removing: $file
    rm $file
done

exit 0