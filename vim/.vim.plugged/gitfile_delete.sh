#!/bin/bash


git_files=$(find ./ -type d -name ".git" )

for file in $git_files; do
    if [ -d "$file" ]; then
        rm -rf "$file"
        echo "Deleted: $file"
    fi
done

