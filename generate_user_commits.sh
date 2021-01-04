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
cd git_lab2_lesson2/

function commit_changes() {
	git add .
	git commit -m "created git_lab2_lesson2/$1" --author "$NAME <$EMAIL>"
	git push origin $CURRENT_BRANCH
}

git checkout -b $CURRENT_BRANCH
echo $BORN_YEAR > $NAME.txt
commit_changes $NAME.txt
cd ..

$CURRENT_BRANCH="feature/list$NAME"
git checkout -b $CURRENT_BRANCH
echo $NAME > list.txt;
commit_changes list.txt
cd ..

$CURRENT_BRANCH="feature/school$NAME"
git checkout -b $CURRENT_BRANCH
echo $SCHOOL > ${NAME}School.txt
commit_changes ${NAME}School.txt
cd ..

echo "Done";
exit 0;
