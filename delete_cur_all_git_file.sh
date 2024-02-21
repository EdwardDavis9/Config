#!/bin/bash
#
# 删除当前目录下所有git文件，防止重复添加其他仓库的git文件 
# 添加非本仓库的git文件，可能导致git无法上传文件
##

# 列出所有包含 .git 的文件夹
git_folders=$(find .  -name ".git*")

# 循环遍历每个文件夹，并删除其中的 .git 文件
for folder in $git_folders; do
    if [ -e "$folder" ]; then
        rm -rf "$folder"
        echo "Deleted: $folder"
    fi
done

