#!/bin/bash
#rsync -rvz ./storage/app/static/ pi:~/statamic-blog/
cd ./storage/app/static
git add *
git commit -m 'Build'
git push origin main
