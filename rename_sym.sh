#!/bin/bash

for f in *.png
 do
  name=`echo $f | sed -e "s/__/, /g" -e "s/_-/ \(/g" -e "s/-/\)/g" -e "s/_/ /g"`
  mv "$f" "finished/$name"
 done

cp finished/* ~/.config/QLandkarteGT/WaypointIcons/
