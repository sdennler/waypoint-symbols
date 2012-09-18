#!/bin/bash

sym=(\
 "Flag, Blue" "Flag, Green" "Flag, Red" "Civil"\
 "Pin, Blue" "Pin, Green" "Pin, Red" "Golf Course"\
 "Block, Blue" "Block, Green" "Block, Red" "Stadium"\
 "Navaid, Blue" "Navaid, Green" "Navaid, Red" "Navaid, White"\
 "Navaid, Amber" "Navaid, Black" "Navaid, Orange" "Navaid, Violet"\
 "City (Small)" "City (Medium)" "City (Large)" "Crossing"\
 "Residence" "Fishing Hot Spot Facility" "Lodge" "Museum"\

 "" "" "" ""\
 "" "" "" ""\
 "" "" "" ""\
 "" "" "" ""\
 "" "" "" ""\
 "" "" "" ""\
 "" "" "" ""\
)

echo '<?xml version="1.0" encoding="UTF-8"?>
<gpx
  version="1.0"
  creator="GPSBabel - http://www.gpsbabel.org"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns="http://www.topografix.com/GPX/1/0"
  xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd http://www.garmin.com/xmlschemas/GpxExtensions/v3 http://www.garmin.com/xmlschemas/GpxExtensionsv3.xsd http://www.garmin.com/xmlschemas/TrackPointExtension/v1 http://www.garmin.com/xmlschemas/TrackPointExtensionv1.xsd http://www.garmin.com/xmlschemas/WaypointExtension/v1 http://www.garmin.com/xmlschemas/WaypointExtensionv1.xsd http://www.qlandkarte.org/xmlschemas/v1.1 http://www.qlandkarte.org/xmlschemas/v1.1/ql-extensions.xsd">'

symi=0
for (( b = 0; b <= 9; b++ ))
 do
 for (( x = 0; x <= 6; x++ ))
  do
   for (( y = 0; y <= 3; y++ ))
    do
     let lat=9-$x
     let lon=$y
     #echo -n "$lat:$lon "
     echo "<wpt lat=\"3.10$lat\" lon=\"101.1$b$lon\">"
     echo "  <name>XT $b:$x:$y ${sym[$symi]}</name>"
     echo "  <sym>${sym[$symi]}</sym>"
     echo "</wpt>"
     let symi++
    done
    #echo
  done
 done

echo '</gpx>'
