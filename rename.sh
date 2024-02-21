#!/bin/bash

# 计数器，从1开始
counter=1

# 循环处理当前目录下的所有视频文件
for file in *.*; do
    # 获取文件名和扩展名
    filename="${file%.*}"
    extension="${file##*.}"

    # 检查文件名是否包含下划线
    if [[ $filename == *_* ]]; then
        # 分割文件名，以下划线为界
        name_parts=($(echo $filename | tr '_' '\n'))

        name_part=($(echo $name_parts | tr '-' '\n'))
        # 检查第一部分是否是自然数
        if [[ ${name_part[0]} =~ ^[0-9]+$ ]]; then
            # 如果是自然数，则使用该数字作为计数器值
            counter=${name_part[0]}
            mv "$file" "${counter}_${name_parts[1]}_${extension}"
        fi
    fi
    ls 
done