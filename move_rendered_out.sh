#!bin/bash
# Move scaled meshes that already have been rendered out of the directory, into a bin

path_to_ds=$1
split=$2
category=$3

mkdir ${path_to_ds}/${category%%_*}_2_rendered

for FILE in ${path_to_ds}/${split}/${category}/*
do
    filename=$(basename $FILE)
    itemname=${filename%%.*}
    echo $itemname
    echo $FILE
    if [[ -f "${path_to_ds}/${split}/${category%%_*}_2_rendered/${itemname}.off.h5" ]]
    then
        echo Found ${itemname}
        mv ${path_to_ds}/${split}/${category%%_*}_2_rendered/${itemname}.off.h5 ${path_to_ds}/${category%%_*}_2_rendered/
    fi
done
