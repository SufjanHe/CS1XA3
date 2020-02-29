#!/bin/bash

menu(){
	echo "Execute 'Checkout Latest Merge' by typing 1"
	echo "Execute 'File Size List' by typing 2"
	echo "Execute 'File Type Count' by typing 3"
	echo "Execute 'File Extension Change/Restore' by typing 4"
	echo "Execute 'Number Game/History' by typing 5"
	echo "Execute 'FIXME Log' by typing 6"
	echo "Execute 'Find Tag' by typing 7"
	echo "Execute 'Backup and Delete /Restore' by typing 8"
	read -p "I wanna doooooo:" choice
}

menu

if [ $choice -eq 1 ]; then
	line=`git log --grep='Merge' -i --oneline|head -1`
	commit=${line:0:7}
	git checkout $commit
	read -p "Want More?(yes/no)" more
elif [ $choice -eq 2 ]; then
	find .. -type f -exec du -ah {} + |sort -rh
	read -p "Want More?(yes/no)" more
elif [ $choice -eq 3 ]; then
	read -p "Which extension would like to seeeeee?" extension
	num=`find .. -name "*.$extension"|wc -l`
	echo "There are "$num" files with the extention "$extension" in repo"
	read -p "Want More?(yes/no)" more
elif [ $choice -eq 4 ]; then
	read -p "Change or Restore?" CorR
	if [ $CorR = "Change" ]; then
		read -p "change which extension to what extension?" ext1 ext2
		changed=`find .. -name "*.$ext1"`
		if [ -f extension.log ]; then
                	rm extension.log
        	fi
        	touch extension.log
		echo "$ext1" >> extension.log
		for f in $changed; do
			mv -- "$f" "${f%.$ext1}.$ext2"
			echo "${f%.$ext1}.$ext2" >> extension.log
		done
	elif [ $CorR = "Restore" ]; then
		oriExt=`head -1 extension.log`
		storedPath=`tail -n +2 extension.log`
		for p in ${storedPath[@]}; do
			fpath=`dirname "$p"`
			fname=`basename "$p" | cut -f 1 -d '.'`
                	mv "$p" "$fpath/$fname.$oriExt"
        	done
	fi
	read -p "Want More?(yes/no)" more
elif [ $choice -eq 5 ]; then
	if [ ! -f history.log ]; then
		touch history.log
		echo 0 > history.log
	fi
        read -p "Game or History?" GorH
	if [ $GorH = "Game" ]; then
		num=$[RANDOM%100]
		counter=0
		while :
		do
			read -p "take a guess:" guess
			if [ "$guess" -eq "$num" ]; then
				echo "Correct!"
				break
			elif [ "$guess" -lt "$num" ]; then
                                echo "too low"
                        elif [ "$guess" -gt "$num" ]; then
                                echo "too high"
			fi
			counter=$((counter + 1))
		done
		best=`cat history.log`
		if [ "$best" -eq 0 ]; then
			echo $counter > history.log
		elif [ "$best" -gt $counter ]; then
			echo $counter > history.log
		fi
	elif [ $GorH = "History" ]; then
		hist=`cat history.log`
		echo "You solved it in "$hist" steps"
	fi
        read -p "Want More?(yes/no)" more
elif [ $choice -eq 6 ]; then
        if [ -f fixme.log ]; then
		rm fixme.log
	fi
	touch fixme.log
	files=`find .. -type f`
	for eachfile in $files; do
		var=`tail -1 "$eachfile" | grep "#FIXME"`
		if [ "#FIXME" = "$var" ]; then
			echo $eachfile >> fixme.log
		fi
	done
        read -p "Want More?(yes/no)" more
elif [ $choice -eq 7 ]; then
	read -p "Tell me what Tag?" tag
	if [ -f "$tag".log ]; then
                rm "$tag".log
        fi
        touch "$tag".log
	py=`find .. -type f -name "*.py"`
	touch tagstore
	IFS=$'\n'
	for eachpy in "$py"; do
		comments=($(grep -i '^#' "$eachpy"))
		for x in ${comments[@]}; do
			echo $x >> tagstore
		done
	done
	taglines=($(grep "$tag" tagstore))
	for y in ${taglines[@]}; do
                echo $y >> "$tag".log
	done
	unset IFS
	rm tagstore
	read -p "Want More?(yes/no)" more
elif [ $choice -eq 8 ]; then
	read -p "Backup or Restore?" BorR
	if [ $BorR = "Backup" ]; then
		if [ -d backup ]; then
			rm -r backup
		fi
		mkdir backup
		touch backup/restore.log
		tmp=`find .. -type f -name "*.tmp"`
		for t in $tmp; do
			cp $t backup
			echo $t >> backup/restore.log
			rm $t
		done
	elif [ $BorR = "Restore" ]; then
		if [ ! -f backup/restore.log ]; then
			echo "Error: Haven't Backup yet"
		fi
		bkup=`cat backup/restore.log`
		for l in ${bkup[@]}; do
			fn=`basename "$l"`
			fp=`dirname "$l"`
                	mv "backup/$fn" "$fp"
        	done
	fi
	read -p "Want More?(yes/no)" more
fi

if [ $more = "yes" ]; then
	./project_analyze.sh
fi
