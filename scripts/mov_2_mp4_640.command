#!/bin/bash

# ファイルの在処指定
cd /Users/catalina/Desktop/Globis学び放題

# 指定ファイル検索
for file in `\find . -maxdepth 1 -name '*.mov'`;
do
  filename=${file%.*}	# ファイル名のみ取り出し
  extension=${file##*.}	# 拡張子の取り出し
 
echo 'ファイル名：'　$filename.$extension
 
ffmpeg -i $file -vcodec libx264 -vf scale=640:-1 ${file%.*}_conv.mp4

done

#　付録
  # ffmpeg -i ${file} -vf "scale=640:-1" -q 2 ${file}_resize.jpg
  # ffmpeg -i $i -vn -ac 2 -ar 44100 -ab 256k -acodec libmp3lame -f mp3 ${i%.*}.mp3
 
