#!/bin/bash

if [[ $# < 4 ]]; then
	echo "Not enough arguments";
	echo "usage: sh generate_users_commits.sh <name> <born_year> <school> <email> without angle parenthesis";
	exit 1;
fi

NAME=$1
BORN_YEAR=$2
SCHOOL=$3
EMAIL=$4

CURRENT_BRANCH="feature/user$NAME"
[ ! -d "git_lab2_lesson2" ] && mkdir git_lab2_lesson2 
# delete generate_user_commits.sh. Keep it only in script branch!
rm generate_user_commits.sh
cd git_lab2_lesson2/

function commit_changes() {
	git add .
	git commit -m "created git_lab2_lesson2/$1" --author "$NAME <$EMAIL>"
	git push origin $CURRENT_BRANCH
}

rm *.*
git checkout -b $CURRENT_BRANCH
echo $BORN_YEAR > $NAME.txt
commit_changes $NAME.txt

CURRENT_BRANCH="feature/list$NAME"
rm *.*
git checkout -b $CURRENT_BRANCH
echo $NAME > list.txt;
commit_changes list.txt

CURRENT_BRANCH="feature/school$NAME"
rm *.*
git checkout -b $CURRENT_BRANCH
echo $SCHOOL > ${NAME}School.txt
commit_changes ${NAME}School.txt

git checkout script

echo "Done";
exit 0;

