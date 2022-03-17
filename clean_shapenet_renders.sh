#!bin/bash
# Cleans out empty .off.h5 files in the given directory
# Example messed up path (valid use for script): input_meshes_shapenet_off/shapenet/train/02828884_2_rendered

path=$1

echo "Cleaning empty .h5 files in $path"

for file in $path/*.h5
do
    echo file: $(basename $file)

    input="$file"
    valid_file=false
    filesize=$(wc -c $file | awk '{print $1}')

    if (( $filesize < 1 ))
    then
        echo "Removing bad file: $(basename $file)"
        mv $file ./file_dump
    fi
done
