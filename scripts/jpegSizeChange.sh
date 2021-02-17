#!/bin/sh
for file in `\find . -maxdepth 1 -name '*.jpg'`;
do
  filename=${file%.*}	# ファイル名のみ取り出し
  extension=${file##*.}	# 拡張子の取り出し
  ffmpeg -i ${file} -vf "scale=640:-1" -q 2 ${file}_resize.jpg
done