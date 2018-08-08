#!/bin/bash
directory="~/.apod/"
if [ ! -d $directory ];then
   mkdir ~/.apod/
else
	rm *.jpg *.html *.txt *.asp
fi
cd ~/.apod
a='https://spark.adobe.com/page/GSqkwEOt7dqNx/'
wget "$a"
base='https://spark.adobe.com/page/GSqkwEOt7dqNx/'
#grep 'href=i"' ap180724.html > tmp.txt
b=$(grep 'href="i' index.html | awk -F "\"" '{print $10}' | shuf -n 1)
c=$base$b
wget -O "back.jpg" $c
imname=$(find *.jpg)
/usr/bin/gsettings set org.gnome.desktop.background picture-uri "file:///$(pwd)/$imname"
cd 
