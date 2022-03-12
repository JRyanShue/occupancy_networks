#!bin/bash
# Make a shapenet dataset in .off format watertight

for CATEGORY in input_meshes_shapenet_off/shapenet/train/*
do 
    category_name=$(basename -- "$CATEGORY")

    # Check for raw directory (no preprocessing)
    if [[ "$category_name" != *"_"* ]]
    then
        echo "Processing $category_name"
        # Run scaling
        python external/mesh-fusion/1_scale.py \
            --in_dir="./input_meshes_shapenet_off/shapenet/train/${category_name}/" \
            --out_dir="./input_meshes_shapenet_off/shapenet/train/${category_name}_1_scaled/"

        # Run rendering
        python external/mesh-fusion/2_fusion.py \
            --mode=render \
            --in_dir="./input_meshes_shapenet_off/shapenet/train/${category_name}_1_scaled/" \
            --out_dir="./input_meshes_shapenet_off/shapenet/train/${category_name}_2_rendered/"

        # Run fusion
        python external/mesh-fusion/2_fusion.py \
            --mode=fuse \
            --in_dir="./input_meshes_shapenet_off/shapenet/train/${category_name}_2_rendered/" \
            --out_dir="./input_meshes_shapenet_off/shapenet/train/${category_name}_3_fused/"
    fi

    # ./ldif/gaps/bin/x86_64/msh2msh $FILE $new_filepath
done
