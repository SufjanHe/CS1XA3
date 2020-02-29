# CS 1XA3 Project01 - <hez66@mcmaster.ca>

## Usage
Execute this script from project root with:

* chmod +x CS1XA3/Project01/project_analyze.sh 
* cd CS1XA3/Project01
* ./project_analyze.sh

With possible value of one argument choice
1. input 1: Checkout Latest Merge
1. input 2: File Size List
1. input 3: File Type Count
1. input 4: File Extension Change/Restore
1. input 5: Number Game/History
1. input 6: FIXME Log
1. input 7: Find Tag
1. input 8: Backup and Delete/Restore

After executing a feature:
* input yes to choose another feature to excute
* input no to stop

## Feature 03: Checkout Latest Merge
Description: this feature does checking out the most recent commit with the word "merge" (case insensitive) in the commit message\
Execution: execute this feature by inputting 1 when excuting the script CS1XA3/Project01/project_analyze\
Reference: some code was taken from [[https://git-scm.com/docs/git-log#Documentation/git-log.txt---merges]] and [[https://stackoverflow.com/questions/46021955/get-first-line-of-a-shell-commands-output]]

## Feature 04: File Size List
Description: this feature does listing & sorting all files in the repo and their sizes\
Execution: execute this feature by inputting 2 when excuting the script CS1XA3/Project01/project_analyze\
Reference: some code was taken from [[https://unix.stackexchange.com/questions/88065/sorting-files-according-to-size-recursively]]

## Feature 05: File Type Count
Description: this feature does counting the number of files in the repo with the extension given by user\
Execution: execute this feature by inputting 3 when excuting the script CS1XA3/Project01/project_analyze;then input the extension with which you would like to count files\
Reference: some code was taken from [[https://www.2daygeek.com/how-to-count-files-by-extension-in-linux/]]

## Custom Feature 01: File Extension Change/Restore
Description: Users give 2 extension and can choose Change or Restore:
* If the user selects Change:
  * For each files with given extension in repo, change the extension to what you want
  * Store a log of the file and its original extension in CS1XA3/Project01/extension.log
* If the user selects Restore:Restore each file to its original extension

Execution: execute this feature by inputting 4 when excuting the script CS1XA3/Project01/project_analyze; then choose Change or Restore. If choosing Change, input two extension with which you would like to convert from one to the other.\
Reference: some code was taken from [[https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash], [https://stackoverflow.com/questions/6121091/get-file-directory-path-from-file-path/6121114], [https://stackoverflow.com/questions/12152626/how-can-i-remove-the-extension-of-a-filename-in-a-shell-script/12152997], [https://unix.stackexchange.com/questions/19654/how-do-i-change-the-extension-of-multiple-files], [https://osr507doc.xinuos.com/en/OSTut/Reading_just_the_first_or_last_lines_of_a_file.html]]

## Custom Feature 02: Number Game/History
Description: Users can choose Game or History:
* If the user selects Game: the user is  going to play the Number Game, to guess a randomly generated number in 0~100.
  * When playing the game, hints of "too high", "too low" will be given
  * If the user succeed to guess the number, "Correct!" will be printed
  * How many attemps the user take to succeed will be record in CS1XA3/Project01/history.log (overwrite if it exists)
* If the user selected History: The best try(fewest attemps) will be shown.

Execution: execute this feature by inputting 5 when excuting the script CS1XA3/Project01/project_analyze; then choose Game or History.If choosing Game, input the number you guess.\
Reference: some code was taken from [[https://stackoverflow.com/questions/10515964/counter-increment-in-bash-loop-not-working]]

## Feature 02: FIXME Log
Description: this feature does finding every file in the repo that has the word #FIXME in the last line, then putting the list of these file names in CS1XA3/Project01/fixme.log (overwrite it if it existed) with each file separated by a newline\
Execution: execute this feature by inputting 6 when excuting the script CS1XA3/Project01/project_analyze\
Reference: some code was taken from [[https://osr507doc.xinuos.com/en/OSTut/Reading_just_the_first_or_last_lines_of_a_file.html]]

## Feature 06: Find Tag
Description: this feature does creating a log file CS1XA3/Project01/Tag.log(overwrite if it exists), where Tag is your input. For each python file in the repo, find all lines beginning with a comment (i.e #) and including Tag, and put them in CS1XA3/Project01/Tag.log\
Execution: execute this feature by inputting 7 when excuting the script CS1XA3/Project01/project_analyze and then inputting a Tag you'd like to input\
Reference: some code was taken from [[https://stackoverflow.com/questions/29453265/bash-script-printing-grepd-lines-from-file]]

## Feature 08: Backup and Delete/Restore
Description: Users can choose Backup or Restore:
* If the user selects Backup:
  * Create an empty directory CS1XA3/Project01/backup if it does't exist. Empty the directory if it exist
  * Find all files that end in the .tmp extension, and copy them to the CS1XA3/Project01/backup directory. Delete them from their original location.
  * Create a file CS1XA3/Project01/backup/restore.log that contains a list of paths of the files original locations
* If the user selected Restore: restore the files to their original location. If the file does not exist, through an error message

Execution: execute this feature by inputting 8 when excuting the script CS1XA3/Project01/poject_analyze; then choose Change or Restore.\
Reference: some code was taken from [[https://stackoverflow.com/questions/6121091/get-file-directory-path-from-file-path/6121114]]
