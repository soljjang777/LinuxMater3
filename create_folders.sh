#!/bin/bash
today=$(date '+%Y-%m-%d')

mkdir "$today"

for i in `seq 1 5`
do
    mkdir "$today/class$i"
done

echo "폴더 '$today'와 그 하위 폴더 class1, class2, class3, class4, class5가 생성되었습니다."