#!/bin/bash

git init git-rebase
cd git-rebase
touch readme.txt
mkdir src
git add readme.txt
git commit -m "C1: ajout readme"
touch src/sources.txt
git add src/sources.txt
git commit -m "C2: sources"
git branch feature1
git checkout feature1
touch src/feature1.txt
git add src/feature1.txt
git commit -m "C3: coding de feature1"
git branch feature2
git checkout feature1
echo "feature1" >> src/feature1.txt
git add src/feature1.txt
git commit -m "C4: coding de feature1"
git checkout master
echo "readme me first" >> readme.txt
git add readme.txt
git commit -m "C5: update readme.txt"
echo "======" >> readme.txt
git commit -a -m "C6: update readme.txt"
echo "copyright blabla" >> readme.txt
git commit -a -m "C7: update readme.txt"
git checkout feature2
touch src/feature2.txt
git add src/feature2.txt
git commit -m "C8: coding de feature2"
echo "feature2" >> src/feature2.txt
git commit -a -m "C9: coding de feature2"
git checkout feature1
echo "aaa" >> src/feature1.txt
git commit -a -m "C10: coding de feature1"
git rebase --onto master feature1 feature2
git checkout master
git merge feature2
git rebase master feature1
git checkout master
git merge feature1
git branch -d feature2
git branch -d feature1

