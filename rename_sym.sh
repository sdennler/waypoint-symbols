#!/bin/bash

for f in *.png
 do
  name=`echo $f | sed\
   -e "s/__/, /g"\
   -e "s/_--/ \(/g"\
   -e "s/--/\)/g"\
   -e "s/_/ /g"`
  mv "$f" "finished/$name"
 done

cp finished/* ~/.config/QLandkarteGT/WaypointIcons/

if [ -d /media/Garmin\ SD/Garmin/CustomSymbols/ ]; then
 cp garmin/* /media/Garmin\ SD/Garmin/CustomSymbols/
fi
