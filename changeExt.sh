#!/bin/bash
#Andrew Seligman
#Changes the extension of a list of files
#Accepts 3+ arguments in the form <oldext> <newext> <file> ...

usage="USAGE: "$0" <oldext> <newext> <file...>"

if (( $# < 3 ));
then
    #too few arguments
    echo Error: Too few arguments
    echo $usage
    exit 1
else
    #place the arguments into a list
    files=( "$@" )
    #copy old and new extensions then remove them from the list
    oldext=${files[0]}
    newext=${files[1]}
    unset files[0]
    unset files[1]
fi

#rename file extensions
for file in ${files[*]}
do
    #get directory location
    path=`dirname $file`
    #get file name
    filename=`basename $file`
    #get base of file name (file - oldext)
    prefix=`basename $file $oldext`
    
    #ensure file exists
    if [ ! -f $file ];
    then
        echo Error: $file not found or not a regular file
    #if prefix is not the entire file name then change it
    elif [ $prefix != $filename ];
    then
        newname=$prefix$newext
        echo changing $file from $filename to $newname
        `mv $file ${path}/${newname}`
    else
        echo $file not modified: suffix not found or filename=suffix
    fi
done

unset files

exit 0
