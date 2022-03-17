#!bin/bash
# Move scaled meshes that already have been rendered out of the directory, into a bin

path_to_ds=$1
split=$2
category=$3

mkdir ${path_to_ds}/${category%%_*}_1_scaled

for FILE in ${path_to_ds}/${split}/${category}/*
do
    filename=$(basename $FILE)
    itemname=${filename%%.*}
    echo $itemname
    echo $FILE
    if [[ -f "${path_to_ds}/${split}/${category%%_*}_1_scaled/${itemname}.off" ]]
    then
        echo Found ${itemname}
        mv ${path_to_ds}/${split}/${category%%_*}_1_scaled/${itemname}.off ${path_to_ds}/${category%%_*}_1_scaled/
    fi
done
