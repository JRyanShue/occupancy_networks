#!bin/bash
# Cleans out whitespace-only .off files in the given directory
# Example messed up path (valid use for script): input_meshes_shapenet_off/shapenet/train/02691156_1_scaled

path=$1

echo "Cleaning whitespace-only .off files in $path"

for file in $path/*.off
do
    # echo file: $(basename $file)
    input="$file"
    valid_file=false
    while IFS= read -r line
    do
        # echo "$line"
        if [[ "$line" == *"OFF"* ]]
        then
            # echo "Found OFF"
            valid_file=true
            break
        fi
        break
    done < "$input"
    if [[ "$valid_file" == false ]]
    then
        echo "Removing bad file: $(basename $file)"
        mv $file ./file_dump
    fi
done
