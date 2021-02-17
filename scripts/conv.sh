#!/bin/bash

##　使い方
## sh /Users/catalina/ko/scripts/conv.sh "file name" 640 

## パラメータを入力
file=$1
res=$2
number=$#
filex=${file%.*}_${res}_conv	# "%.*"：拡張子なしオプション
fileout=${filex}.mp4	# ファイル名に属性mp4を付加

## 状態表示
echo '引数の数: ' $number
echo '入力ファイル名： ' $file
echo '出力ドット数（横）： ' $res
echo '出力ファイル名： ' $filex
echo '出力ファイル名： ' ${fileout##*/}		# "##*/"：Pathなし表示
echo 'ディレクトリ： ' ${fileout%/*}	# "%/*"：ディレクトリ表示

## 入力パラメータ数を確認　
if [ $number -ne 2 ]; then
  echo 'Error argument count.'
  exit 1;
fi

## ffmpegでH264へ変換
ffmpeg -i $file -vcodec libx264 -vf scale=$res:-1 $filex.mp4
