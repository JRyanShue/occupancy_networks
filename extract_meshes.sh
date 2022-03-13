#!bin/bash
# Extracts the meshes from the given folder structure.

parent_dir=./ShapeNet_obj

echo Extracting meshes from $parent_dir ...

for CATEGORY in $parent_dir/*
do
    category_name=$(basename $CATEGORY)
    number_of_immediate_folders=$(( $(find ${CATEGORY} -maxdepth 1 -type d | wc -l) - 1 ))
    if (($number_of_immediate_folders == 1))
    then
        CATEGORY=${CATEGORY}/$category_name
    fi
    echo Category: $category_name
    echo $CATEGORY
    echo $number_of_immediate_folders
    for MODEL in $CATEGORY/*
    do
        echo $MODEL
        model_id=$(basename $MODEL)
        extension="${model_id##*.}"
        echo $extension
        # Ignore .obj extensions, as they have already been extracted. 
        if [[ "$extension" == "obj" ]]
        then
            echo continuing
            continue
        fi
        echo asdf
        echo $extension
        mv $MODEL/*.obj $parent_dir/$category_name/$model_id.obj
        rm -r $MODEL
    done
done
