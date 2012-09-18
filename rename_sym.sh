#!/bin/bash

for f in *.png
 do
  name=`echo $f | sed "s/__/, /"`
  mv $f "finished/$name"
 done

cp finished/* ~/.config/QLandkarteGT/WaypointIcons/
