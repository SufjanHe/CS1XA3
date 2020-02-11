#!/bin/bash

menu(){
	echo "Execute 'Checkout Latest Merge' by typing 1"
	echo "Execute 'File Size List' by typing 2"
	echo "Execute 'File Type Count' by typing 3"
	read -p "I wanna doooooo:" choice
}
menu

if [ $choice -eq 1 ]; then
	line=`git log --grep='Merge' -i --oneline|head -1`
	commit=${line:0:7}
	git checkout $commit
	read -p "Want More?(yes/no)" more
elif [ $choice -eq 2 ]; then
	du -ah ..|sort -rh
	read -p "Want More?(yes/no)" more
elif [ $choice -eq 3 ]; then
	read -p"Which extension would like to seeeeee?" extension
	num=`find .. -name "*.$extension"|wc -l`
	echo "There are "$num" files with the extention "$extension" in repo"
	read -p "Want More?(yes/no)" more
fi

if [ $more = "yes" ]; then
	./project_analyze.sh
fi